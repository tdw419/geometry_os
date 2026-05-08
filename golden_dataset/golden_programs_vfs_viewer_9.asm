; DESCRIPTION: This GeOS assembly code creates a window and uses the WINSYS VFS_BLIT operation to visualize the filesystem contents by encoding each file as RGBA pixels, effectively displaying files as colored patterns on the desktop. The window is positioned at coordinates (160, 32) with dimensions 64x64 pixels, and it enters an infinite loop where it continuously yields control, keeping the window open and the filesystem visualization updated.

; vfs_viewer.asm -- VFS Pixel Surface Viewer
;
; "Pixels move pixels" -- creates a window and paints the filesystem
; into it as visible colored pixels. Files ARE the pixels.
;
; Uses WINSYS op=8 (VFS_BLIT) to encode all files from .geometry_os/fs/
; as RGBA pixels and blit them directly into the window.
;
; Row 0: Directory index (magic, file count, per-file entries)
; Row 1+: File data as pixels (each pixel = 4 bytes of content)
;
; The user can SEE their files as colored patterns on the desktop.

; Window parameters
LDI r3, 160       ; x = 160 (right side of desktop)
LDI r13, 32        ; y = 32 (below taskbar)
LDI r9, 64        ; w = 64 pixels wide
LDI r5, 64        ; h = 64 pixels tall
LDI r12, 0         ; title_addr = 0 (no title)
LDI r14, 0         ; WINSYS op=0 (CREATE)
WINSYS r14

; Save window id (r10 has result)
MOV r1, r10

; VFS_BLIT: Paint the filesystem into the window
MOV r10, r1       ; window id
LDI r14, 8         ; WINSYS op=8 (VFS_BLIT)
WINSYS r14

; Spin loop showing the window.
; The files are now visible as pixels on the desktop.
; What you see IS your data.
loop:
  YIELD
  JMP loop
