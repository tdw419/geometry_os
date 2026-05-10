; DESCRIPTION: Creates a magenta rectangular region at (309, 103) spanning 52 by 104 pixels.
; PLAN: r0=309(x), r1=103(y), r2=52(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 103
LDI r2, 52
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
