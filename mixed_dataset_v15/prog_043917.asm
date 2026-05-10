; DESCRIPTION: Creates a blue rectangular region at (342, 53) spanning 63 by 72 pixels.
; PLAN: r0=342(x), r1=53(y), r2=63(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 53
LDI r2, 63
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
