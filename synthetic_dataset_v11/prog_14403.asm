; DESCRIPTION: Creates a blue rectangular region at (75, 150) spanning 16 by 31 pixels.
; PLAN: r0=75(x), r1=150(y), r2=16(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 150
LDI r2, 16
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
