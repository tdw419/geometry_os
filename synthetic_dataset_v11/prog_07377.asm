; DESCRIPTION: Creates a green rectangular region at (127, 215) spanning 119 by 16 pixels.
; PLAN: r0=127(x), r1=215(y), r2=119(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 215
LDI r2, 119
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
