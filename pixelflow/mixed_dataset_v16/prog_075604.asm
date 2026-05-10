; DESCRIPTION: Renders a yellow box of size 37x84 starting at (278, 24).
; PLAN: r0=278(x), r1=24(y), r2=37(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 24
LDI r2, 37
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
