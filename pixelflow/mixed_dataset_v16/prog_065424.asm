; DESCRIPTION: Creates a magenta rectangular region at (178, 195) spanning 106 by 18 pixels.
; PLAN: r0=178(x), r1=195(y), r2=106(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 195
LDI r2, 106
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
