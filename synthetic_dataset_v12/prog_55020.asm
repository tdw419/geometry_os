; DESCRIPTION: Creates a purple rectangular region at (308, 209) spanning 75 by 20 pixels.
; PLAN: r0=308(x), r1=209(y), r2=75(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 209
LDI r2, 75
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
