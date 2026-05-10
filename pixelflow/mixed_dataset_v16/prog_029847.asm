; DESCRIPTION: Creates a yellow rectangular region at (440, 64) spanning 45 by 90 pixels.
; PLAN: r0=440(x), r1=64(y), r2=45(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 64
LDI r2, 45
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
