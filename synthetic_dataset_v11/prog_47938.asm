; DESCRIPTION: Creates a green rectangular region at (54, 153) spanning 32 by 45 pixels.
; PLAN: r0=54(x), r1=153(y), r2=32(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 153
LDI r2, 32
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
