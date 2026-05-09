; DESCRIPTION: Creates a magenta rectangular region at (209, 146) spanning 118 by 61 pixels.
; PLAN: r0=209(x), r1=146(y), r2=118(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 146
LDI r2, 118
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
