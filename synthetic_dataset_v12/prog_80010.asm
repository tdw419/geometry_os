; DESCRIPTION: Creates a magenta rectangular region at (146, 26) spanning 37 by 111 pixels.
; PLAN: r0=146(x), r1=26(y), r2=37(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 26
LDI r2, 37
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
