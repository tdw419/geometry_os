; DESCRIPTION: Creates a blue rectangular region at (203, 193) spanning 18 by 10 pixels.
; PLAN: r0=203(x), r1=193(y), r2=18(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 193
LDI r2, 18
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
