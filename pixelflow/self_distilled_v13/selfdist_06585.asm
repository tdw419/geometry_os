; DESCRIPTION: Renders a cyan rectangular region spanning 66 by 33 at (141, 43).
; PLAN: r0=141(x), r1=43(y), r2=66(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 43
LDI r2, 66
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
