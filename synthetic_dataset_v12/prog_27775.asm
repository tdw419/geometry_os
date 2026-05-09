; DESCRIPTION: Creates a blue rectangular region at (54, 7) spanning 18 by 95 pixels.
; PLAN: r0=54(x), r1=7(y), r2=18(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 7
LDI r2, 18
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
