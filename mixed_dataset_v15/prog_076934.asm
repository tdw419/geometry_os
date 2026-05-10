; DESCRIPTION: Creates a blue rectangular region at (402, 60) spanning 50 by 58 pixels.
; PLAN: r0=402(x), r1=60(y), r2=50(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 60
LDI r2, 50
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
