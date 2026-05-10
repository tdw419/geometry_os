; DESCRIPTION: Renders a cyan rectangular region spanning 105 by 117 at (396, 155).
; PLAN: r0=396(x), r1=155(y), r2=105(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 155
LDI r2, 105
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
