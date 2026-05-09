; DESCRIPTION: Creates a green rectangular region at (82, 45) spanning 107 by 84 pixels.
; PLAN: r0=82(x), r1=45(y), r2=107(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 45
LDI r2, 107
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
