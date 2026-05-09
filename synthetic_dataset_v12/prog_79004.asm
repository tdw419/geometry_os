; DESCRIPTION: Creates a blue rectangular region at (76, 117) spanning 120 by 50 pixels.
; PLAN: r0=76(x), r1=117(y), r2=120(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 117
LDI r2, 120
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
