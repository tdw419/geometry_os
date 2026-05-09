; DESCRIPTION: Creates a red rectangular region at (313, 162) spanning 94 by 10 pixels.
; PLAN: r0=313(x), r1=162(y), r2=94(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 162
LDI r2, 94
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
