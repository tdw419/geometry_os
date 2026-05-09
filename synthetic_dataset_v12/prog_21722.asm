; DESCRIPTION: Creates a green rectangular region at (20, 48) spanning 95 by 45 pixels.
; PLAN: r0=20(x), r1=48(y), r2=95(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 48
LDI r2, 95
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
