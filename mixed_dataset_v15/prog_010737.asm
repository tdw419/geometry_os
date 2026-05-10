; DESCRIPTION: Creates a white rectangular region at (428, 69) spanning 58 by 59 pixels.
; PLAN: r0=428(x), r1=69(y), r2=58(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 69
LDI r2, 58
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
