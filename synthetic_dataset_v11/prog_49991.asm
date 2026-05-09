; DESCRIPTION: Composite: . Then Creates a green rectangular region at (20, 32) spanning 97 by 83 pixels. Then Places a red circle of radius 19 at center (46, 151).
; PLAN: r0=20(x), r1=32(y), r2=97(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=46(x), r1=151(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a green rectangular region at (20, 32) spanning 97 by 83 pixels.
; PLAN: r0=20(x), r1=32(y), r2=97(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 32
LDI r2, 97
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 19 at center (46, 151).
; PLAN: r0=46(x), r1=151(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 151
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
