; DESCRIPTION: Creates a red rectangular region at (35, 127) spanning 58 by 80 pixels.
; PLAN: r0=35(x), r1=127(y), r2=58(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 127
LDI r2, 58
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
