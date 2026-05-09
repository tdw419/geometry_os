; DESCRIPTION: Creates a magenta rectangular region at (109, 229) spanning 65 by 25 pixels.
; PLAN: r0=109(x), r1=229(y), r2=65(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 229
LDI r2, 65
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
