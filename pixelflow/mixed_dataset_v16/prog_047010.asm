; DESCRIPTION: Renders a cyan rectangular region spanning 19 by 92 at (140, 110).
; PLAN: r0=140(x), r1=110(y), r2=19(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 110
LDI r2, 19
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
