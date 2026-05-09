; DESCRIPTION: Creates a purple rectangular region at (215, 188) spanning 105 by 10 pixels.
; PLAN: r0=215(x), r1=188(y), r2=105(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 188
LDI r2, 105
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
