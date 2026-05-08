; DESCRIPTION: A red object centered at the screen with fixed size.

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
LDI r12, 160       ; x = 160 (right side of desktop)
LDI r15, 32        ; y = 32 (below taskbar)
LDI r13, 64        ; w = 64 pixels wide
LDI r6, 64        ; h = 64 pixels tall
LDI r0, 0         ; title_addr = 0 (no title)
LDI r5, 0         ; WINSYS op=0 (CREATE)
WINSYS r5

; Save window id (r7 has result)
MOV r11, r7

; VFS_BLIT: Paint the filesystem into the window
MOV r7, r11       ; window id
LDI r5, 8         ; WINSYS op=8 (VFS_BLIT)
WINSYS r5

; Spin loop showing the window.
; The files are now visible as pixels on the desktop.
; What you see IS your data.
loop:
  YIELD
  JMP loop
