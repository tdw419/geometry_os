; DESCRIPTION: Creates a green rectangular region at (30, 164) spanning 87 by 90 pixels.
; PLAN: r0=30(x), r1=164(y), r2=87(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 164
LDI r2, 87
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
