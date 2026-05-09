; DESCRIPTION: Creates a magenta rectangular region at (18, 220) spanning 63 by 30 pixels.
; PLAN: r0=18(x), r1=220(y), r2=63(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 220
LDI r2, 63
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
