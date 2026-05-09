; DESCRIPTION: Creates a yellow rectangular region at (180, 217) spanning 45 by 20 pixels.
; PLAN: r0=180(x), r1=217(y), r2=45(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 217
LDI r2, 45
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
