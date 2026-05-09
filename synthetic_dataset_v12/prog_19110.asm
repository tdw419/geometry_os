; DESCRIPTION: Creates a red rectangular region at (313, 44) spanning 112 by 67 pixels.
; PLAN: r0=313(x), r1=44(y), r2=112(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 44
LDI r2, 112
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
