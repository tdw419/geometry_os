; DESCRIPTION: Creates a red rectangular region at (57, 84) spanning 75 by 109 pixels.
; PLAN: r0=57(x), r1=84(y), r2=75(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 84
LDI r2, 75
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
