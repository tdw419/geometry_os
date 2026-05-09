; DESCRIPTION: Creates a magenta rectangular region at (130, 150) spanning 109 by 49 pixels.
; PLAN: r0=130(x), r1=150(y), r2=109(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 150
LDI r2, 109
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
