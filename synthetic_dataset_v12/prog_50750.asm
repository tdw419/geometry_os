; DESCRIPTION: Creates a black rectangular region at (57, 74) spanning 23 by 25 pixels.
; PLAN: r0=57(x), r1=74(y), r2=23(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 74
LDI r2, 23
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
