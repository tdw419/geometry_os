; DESCRIPTION: Creates a blue rectangular region at (253, 163) spanning 79 by 90 pixels.
; PLAN: r0=253(x), r1=163(y), r2=79(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 163
LDI r2, 79
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
