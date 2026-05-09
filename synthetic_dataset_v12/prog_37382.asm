; DESCRIPTION: Creates a purple rectangular region at (265, 184) spanning 65 by 65 pixels.
; PLAN: r0=265(x), r1=184(y), r2=65(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 184
LDI r2, 65
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
