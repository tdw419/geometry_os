; DESCRIPTION: Creates a white rectangular region at (197, 127) spanning 35 by 118 pixels.
; PLAN: r0=197(x), r1=127(y), r2=35(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 127
LDI r2, 35
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
