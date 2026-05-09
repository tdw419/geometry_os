; DESCRIPTION: Creates a magenta rectangular region at (248, 160) spanning 81 by 91 pixels.
; PLAN: r0=248(x), r1=160(y), r2=81(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 160
LDI r2, 81
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
