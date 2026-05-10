; DESCRIPTION: Creates a red rectangular region at (465, 44) spanning 30 by 43 pixels.
; PLAN: r0=465(x), r1=44(y), r2=30(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 44
LDI r2, 30
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
