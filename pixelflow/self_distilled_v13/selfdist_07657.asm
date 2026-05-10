; DESCRIPTION: Renders a yellow rectangular region spanning 27 by 110 at (198, 105).
; PLAN: r0=198(x), r1=105(y), r2=27(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 105
LDI r2, 27
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
