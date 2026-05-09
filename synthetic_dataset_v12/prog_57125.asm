; DESCRIPTION: Creates a red rectangular region at (321, 59) spanning 117 by 53 pixels.
; PLAN: r0=321(x), r1=59(y), r2=117(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 59
LDI r2, 117
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
