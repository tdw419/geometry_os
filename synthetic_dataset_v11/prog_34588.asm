; DESCRIPTION: Creates a blue rectangular region at (180, 20) spanning 11 by 110 pixels.
; PLAN: r0=180(x), r1=20(y), r2=11(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 20
LDI r2, 11
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
