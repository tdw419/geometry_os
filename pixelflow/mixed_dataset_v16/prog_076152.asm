; DESCRIPTION: Renders a cyan rectangular region spanning 106 by 102 at (149, 19).
; PLAN: r0=149(x), r1=19(y), r2=106(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 19
LDI r2, 106
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
