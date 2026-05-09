; DESCRIPTION: Creates a red rectangular region at (89, 150) spanning 65 by 15 pixels.
; PLAN: r0=89(x), r1=150(y), r2=65(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 150
LDI r2, 65
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
