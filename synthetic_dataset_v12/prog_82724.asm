; DESCRIPTION: Renders a yellow box of size 37x98 starting at (185, 40).
; PLAN: r0=185(x), r1=40(y), r2=37(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 40
LDI r2, 37
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
