; DESCRIPTION: Creates a blue rectangular region at (400, 50) spanning 21 by 74 pixels.
; PLAN: r0=400(x), r1=50(y), r2=21(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 50
LDI r2, 21
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
