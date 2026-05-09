; DESCRIPTION: Renders a yellow box of size 15x65 starting at (230, 157).
; PLAN: r0=230(x), r1=157(y), r2=15(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 157
LDI r2, 15
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
