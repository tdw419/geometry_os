; DESCRIPTION: Renders a cyan rectangular region spanning 19 by 33 at (211, 135).
; PLAN: r0=211(x), r1=135(y), r2=19(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 135
LDI r2, 19
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
