; DESCRIPTION: Creates a green rectangular region at (60, 18) spanning 64 by 109 pixels.
; PLAN: r0=60(x), r1=18(y), r2=64(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 18
LDI r2, 64
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
