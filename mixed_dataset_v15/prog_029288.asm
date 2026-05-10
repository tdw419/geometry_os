; DESCRIPTION: Creates a green rectangular region at (0, 186) spanning 21 by 42 pixels.
; PLAN: r0=0(x), r1=186(y), r2=21(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 186
LDI r2, 21
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
