; DESCRIPTION: Creates a red rectangular region at (230, 99) spanning 50 by 74 pixels.
; PLAN: r0=230(x), r1=99(y), r2=50(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 99
LDI r2, 50
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
