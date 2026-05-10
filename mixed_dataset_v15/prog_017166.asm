; DESCRIPTION: Creates a blue rectangular region at (152, 14) spanning 50 by 120 pixels.
; PLAN: r0=152(x), r1=14(y), r2=50(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 14
LDI r2, 50
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
