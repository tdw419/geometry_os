; DESCRIPTION: Creates a magenta rectangular region at (340, 10) spanning 57 by 68 pixels.
; PLAN: r0=340(x), r1=10(y), r2=57(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 10
LDI r2, 57
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
