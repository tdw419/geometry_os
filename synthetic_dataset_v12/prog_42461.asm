; DESCRIPTION: Renders a yellow box of size 118x65 starting at (301, 105).
; PLAN: r0=301(x), r1=105(y), r2=118(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 105
LDI r2, 118
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
