; DESCRIPTION: Creates a blue rectangular region at (5, 90) spanning 44 by 10 pixels.
; PLAN: r0=5(x), r1=90(y), r2=44(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 90
LDI r2, 44
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
