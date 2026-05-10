; DESCRIPTION: Creates a red rectangular region at (75, 54) spanning 90 by 39 pixels.
; PLAN: r0=75(x), r1=54(y), r2=90(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 54
LDI r2, 90
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
