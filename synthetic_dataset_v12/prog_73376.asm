; DESCRIPTION: Creates a green rectangular region at (46, 144) spanning 83 by 42 pixels.
; PLAN: r0=46(x), r1=144(y), r2=83(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 144
LDI r2, 83
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
