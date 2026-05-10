; DESCRIPTION: Creates a red rectangular region at (260, 60) spanning 57 by 75 pixels.
; PLAN: r0=260(x), r1=60(y), r2=57(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 60
LDI r2, 57
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
