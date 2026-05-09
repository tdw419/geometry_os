; DESCRIPTION: Creates a red rectangular region at (193, 97) spanning 25 by 30 pixels.
; PLAN: r0=193(x), r1=97(y), r2=25(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 97
LDI r2, 25
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
