; DESCRIPTION: Renders a cyan rectangular region spanning 104 by 89 at (309, 106).
; PLAN: r0=309(x), r1=106(y), r2=104(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 106
LDI r2, 104
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
