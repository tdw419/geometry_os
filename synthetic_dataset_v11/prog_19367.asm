; DESCRIPTION: Creates a red rectangular region at (166, 70) spanning 80 by 90 pixels.
; PLAN: r0=166(x), r1=70(y), r2=80(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 70
LDI r2, 80
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
