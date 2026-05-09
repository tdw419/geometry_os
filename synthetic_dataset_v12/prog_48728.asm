; DESCRIPTION: Creates a blue rectangular region at (176, 150) spanning 12 by 85 pixels.
; PLAN: r0=176(x), r1=150(y), r2=12(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 150
LDI r2, 12
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
