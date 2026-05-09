; DESCRIPTION: Creates a magenta rectangular region at (91, 186) spanning 55 by 61 pixels.
; PLAN: r0=91(x), r1=186(y), r2=55(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 186
LDI r2, 55
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
