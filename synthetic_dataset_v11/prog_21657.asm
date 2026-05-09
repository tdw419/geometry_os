; DESCRIPTION: Creates a red rectangular region at (40, 25) spanning 98 by 105 pixels.
; PLAN: r0=40(x), r1=25(y), r2=98(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 25
LDI r2, 98
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
