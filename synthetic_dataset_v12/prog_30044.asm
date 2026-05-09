; DESCRIPTION: Creates a blue rectangular region at (187, 106) spanning 63 by 57 pixels.
; PLAN: r0=187(x), r1=106(y), r2=63(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 106
LDI r2, 63
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
