; DESCRIPTION: Creates a green rectangular region at (309, 168) spanning 113 by 15 pixels.
; PLAN: r0=309(x), r1=168(y), r2=113(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 168
LDI r2, 113
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
