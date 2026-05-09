; DESCRIPTION: Creates a green rectangular region at (430, 36) spanning 45 by 32 pixels.
; PLAN: r0=430(x), r1=36(y), r2=45(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 36
LDI r2, 45
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
