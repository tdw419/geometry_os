; DESCRIPTION: Creates a green rectangular region at (130, 68) spanning 64 by 120 pixels.
; PLAN: r0=130(x), r1=68(y), r2=64(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 68
LDI r2, 64
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
