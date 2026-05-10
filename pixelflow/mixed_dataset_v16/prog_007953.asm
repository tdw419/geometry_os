; DESCRIPTION: Creates a magenta rectangular region at (222, 127) spanning 50 by 109 pixels.
; PLAN: r0=222(x), r1=127(y), r2=50(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 127
LDI r2, 50
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
