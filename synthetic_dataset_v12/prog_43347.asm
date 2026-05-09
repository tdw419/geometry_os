; DESCRIPTION: Creates a magenta rectangular region at (229, 174) spanning 86 by 54 pixels.
; PLAN: r0=229(x), r1=174(y), r2=86(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 174
LDI r2, 86
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
