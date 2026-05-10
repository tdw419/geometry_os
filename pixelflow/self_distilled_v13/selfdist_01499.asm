; DESCRIPTION: Renders a magenta rectangular region spanning 75 by 83 at (115, 152).
; PLAN: r0=115(x), r1=152(y), r2=75(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 152
LDI r2, 75
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
