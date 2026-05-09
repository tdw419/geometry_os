; DESCRIPTION: Creates a magenta rectangular region at (353, 86) spanning 63 by 109 pixels.
; PLAN: r0=353(x), r1=86(y), r2=63(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 86
LDI r2, 63
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
