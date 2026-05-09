; DESCRIPTION: Creates a red rectangular region at (23, 47) spanning 65 by 90 pixels.
; PLAN: r0=23(x), r1=47(y), r2=65(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 47
LDI r2, 65
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
