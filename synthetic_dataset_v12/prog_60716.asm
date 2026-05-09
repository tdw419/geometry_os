; DESCRIPTION: Creates a red rectangular region at (309, 75) spanning 85 by 113 pixels.
; PLAN: r0=309(x), r1=75(y), r2=85(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 75
LDI r2, 85
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
