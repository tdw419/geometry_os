; DESCRIPTION: Creates a purple rectangular region at (188, 164) spanning 32 by 32 pixels.
; PLAN: r0=188(x), r1=164(y), r2=32(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 164
LDI r2, 32
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
