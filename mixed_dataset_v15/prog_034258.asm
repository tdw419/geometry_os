; DESCRIPTION: Renders a cyan rectangular region spanning 47 by 45 at (261, 106).
; PLAN: r0=261(x), r1=106(y), r2=47(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 106
LDI r2, 47
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
