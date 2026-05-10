; DESCRIPTION: Renders a yellow rectangular region spanning 110 by 86 at (63, 55).
; PLAN: r0=63(x), r1=55(y), r2=110(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 55
LDI r2, 110
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
