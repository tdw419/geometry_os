; DESCRIPTION: Creates a magenta rectangular region at (366, 118) spanning 50 by 120 pixels.
; PLAN: r0=366(x), r1=118(y), r2=50(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 118
LDI r2, 50
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
