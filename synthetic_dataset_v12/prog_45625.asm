; DESCRIPTION: Creates a blue rectangular region at (79, 202) spanning 97 by 10 pixels.
; PLAN: r0=79(x), r1=202(y), r2=97(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 202
LDI r2, 97
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
