; DESCRIPTION: Creates a green rectangular region at (198, 100) spanning 89 by 42 pixels.
; PLAN: r0=198(x), r1=100(y), r2=89(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 100
LDI r2, 89
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
