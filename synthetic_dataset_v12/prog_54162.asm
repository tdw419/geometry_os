; DESCRIPTION: Creates a magenta rectangular region at (129, 127) spanning 37 by 50 pixels.
; PLAN: r0=129(x), r1=127(y), r2=37(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 127
LDI r2, 37
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
