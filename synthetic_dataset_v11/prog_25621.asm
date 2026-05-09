; DESCRIPTION: Creates a blue rectangular region at (229, 37) spanning 12 by 109 pixels.
; PLAN: r0=229(x), r1=37(y), r2=12(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 37
LDI r2, 12
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
