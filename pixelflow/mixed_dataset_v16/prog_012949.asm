; DESCRIPTION: Creates a red rectangular region at (313, 160) spanning 114 by 21 pixels.
; PLAN: r0=313(x), r1=160(y), r2=114(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 160
LDI r2, 114
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
