; DESCRIPTION: Renders a white box of size 58x58 starting at (272, 155).
; PLAN: r0=272(x), r1=155(y), r2=58(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 155
LDI r2, 58
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
