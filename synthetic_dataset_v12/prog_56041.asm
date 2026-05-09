; DESCRIPTION: Creates a green rectangular region at (445, 145) spanning 42 by 84 pixels.
; PLAN: r0=445(x), r1=145(y), r2=42(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 145
LDI r2, 42
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
