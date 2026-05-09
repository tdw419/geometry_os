; DESCRIPTION: Composite: . Then Renders a blue box of size 106x80 starting at (104, 82). Then Renders a yellow disk with center (116, 122) and radius 64.
; PLAN: r0=104(x), r1=82(y), r2=106(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=116(x), r1=122(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 106x80 starting at (104, 82).
; PLAN: r0=104(x), r1=82(y), r2=106(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 82
LDI r2, 106
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (116, 122) and radius 64.
; PLAN: r0=116(x), r1=122(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 122
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
