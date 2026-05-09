; DESCRIPTION: Creates a red rectangular region at (70, 185) spanning 117 by 17 pixels.
; PLAN: r0=70(x), r1=185(y), r2=117(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 185
LDI r2, 117
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
