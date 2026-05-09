; DESCRIPTION: Creates a magenta rectangular region at (270, 134) spanning 104 by 95 pixels.
; PLAN: r0=270(x), r1=134(y), r2=104(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 134
LDI r2, 104
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
