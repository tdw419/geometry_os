; DESCRIPTION: Creates a magenta rectangular region at (150, 144) spanning 40 by 65 pixels.
; PLAN: r0=150(x), r1=144(y), r2=40(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 144
LDI r2, 40
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
