; DESCRIPTION: Creates a blue rectangular region at (206, 85) spanning 114 by 120 pixels.
; PLAN: r0=206(x), r1=85(y), r2=114(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 85
LDI r2, 114
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
