; DESCRIPTION: Creates a blue rectangular region at (47, 209) spanning 77 by 13 pixels.
; PLAN: r0=47(x), r1=209(y), r2=77(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 209
LDI r2, 77
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
