; DESCRIPTION: Creates a blue rectangular region at (272, 97) spanning 103 by 118 pixels.
; PLAN: r0=272(x), r1=97(y), r2=103(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 97
LDI r2, 103
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
