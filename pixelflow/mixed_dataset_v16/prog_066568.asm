; DESCRIPTION: Creates a blue rectangular region at (191, 164) spanning 26 by 65 pixels.
; PLAN: r0=191(x), r1=164(y), r2=26(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 164
LDI r2, 26
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
