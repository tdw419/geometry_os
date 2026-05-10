; DESCRIPTION: Renders a cyan rectangular region spanning 26 by 104 at (341, 121).
; PLAN: r0=341(x), r1=121(y), r2=26(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 121
LDI r2, 26
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
