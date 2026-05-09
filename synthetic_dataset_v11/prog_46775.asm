; DESCRIPTION: Creates a red rectangular region at (127, 119) spanning 98 by 74 pixels.
; PLAN: r0=127(x), r1=119(y), r2=98(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 119
LDI r2, 98
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
