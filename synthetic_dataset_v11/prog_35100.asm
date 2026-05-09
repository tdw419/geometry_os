; DESCRIPTION: Creates a magenta rectangular region at (150, 60) spanning 74 by 104 pixels.
; PLAN: r0=150(x), r1=60(y), r2=74(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 60
LDI r2, 74
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
