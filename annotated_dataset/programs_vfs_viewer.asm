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
LDI r1, 160       ; x = 160 (right side of desktop)
LDI r2, 32        ; y = 32 (below taskbar)
LDI r3, 64        ; w = 64 pixels wide
LDI r4, 64        ; h = 64 pixels tall
LDI r5, 0         ; title_addr = 0 (no title)
LDI r6, 0         ; WINSYS op=0 (CREATE)
WINSYS r6

; Save window id (r0 has result)
MOV r10, r0

; VFS_BLIT: Paint the filesystem into the window
MOV r0, r10       ; window id
LDI r6, 8         ; WINSYS op=8 (VFS_BLIT)
WINSYS r6

; Spin loop showing the window.
; The files are now visible as pixels on the desktop.
; What you see IS your data.
loop:
  YIELD
  JMP loop
