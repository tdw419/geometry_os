; DESCRIPTION: Creates a red rectangular region at (149, 127) spanning 85 by 68 pixels.
; PLAN: r0=149(x), r1=127(y), r2=85(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 127
LDI r2, 85
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
