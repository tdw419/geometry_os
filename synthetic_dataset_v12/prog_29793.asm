; DESCRIPTION: Creates a magenta rectangular region at (171, 20) spanning 91 by 118 pixels.
; PLAN: r0=171(x), r1=20(y), r2=91(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 20
LDI r2, 91
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
