; DESCRIPTION: Creates a red rectangular region at (465, 16) spanning 37 by 15 pixels.
; PLAN: r0=465(x), r1=16(y), r2=37(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 16
LDI r2, 37
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
