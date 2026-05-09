; DESCRIPTION: Creates a blue rectangular region at (253, 150) spanning 79 by 60 pixels.
; PLAN: r0=253(x), r1=150(y), r2=79(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 150
LDI r2, 79
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
