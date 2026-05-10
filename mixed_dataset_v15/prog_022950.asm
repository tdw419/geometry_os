; DESCRIPTION: Renders a cyan rectangular region spanning 26 by 115 at (104, 115).
; PLAN: r0=104(x), r1=115(y), r2=26(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 115
LDI r2, 26
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
