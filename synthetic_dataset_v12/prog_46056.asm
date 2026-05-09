; DESCRIPTION: Creates a red rectangular region at (370, 51) spanning 26 by 67 pixels.
; PLAN: r0=370(x), r1=51(y), r2=26(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 51
LDI r2, 26
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
