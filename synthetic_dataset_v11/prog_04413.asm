; DESCRIPTION: Creates a magenta rectangular region at (80, 220) spanning 118 by 16 pixels.
; PLAN: r0=80(x), r1=220(y), r2=118(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 220
LDI r2, 118
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
