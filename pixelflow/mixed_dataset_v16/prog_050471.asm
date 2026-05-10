; DESCRIPTION: Renders a cyan rectangular region spanning 105 by 115 at (10, 75).
; PLAN: r0=10(x), r1=75(y), r2=105(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 75
LDI r2, 105
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
