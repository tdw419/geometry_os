; DESCRIPTION: Creates a green rectangular region at (263, 63) spanning 117 by 12 pixels.
; PLAN: r0=263(x), r1=63(y), r2=117(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 63
LDI r2, 117
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
