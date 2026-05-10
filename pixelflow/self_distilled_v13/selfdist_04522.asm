; DESCRIPTION: Renders a cyan rectangular region spanning 78 by 76 at (188, 185).
; PLAN: r0=188(x), r1=185(y), r2=78(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 185
LDI r2, 78
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
