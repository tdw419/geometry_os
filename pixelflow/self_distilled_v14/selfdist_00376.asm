; DESCRIPTION: Renders a cyan rectangular region spanning 99 by 66 at (106, 50).
; PLAN: r0=106(x), r1=50(y), r2=99(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 50
LDI r2, 99
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
