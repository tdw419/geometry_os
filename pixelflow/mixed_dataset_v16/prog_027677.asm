; DESCRIPTION: Creates a purple rectangular region at (217, 126) spanning 65 by 117 pixels.
; PLAN: r0=217(x), r1=126(y), r2=65(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 126
LDI r2, 65
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
