; DESCRIPTION: Creates a blue rectangular region at (33, 181) spanning 50 by 10 pixels.
; PLAN: r0=33(x), r1=181(y), r2=50(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 181
LDI r2, 50
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
