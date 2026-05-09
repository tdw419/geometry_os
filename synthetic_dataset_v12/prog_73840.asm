; DESCRIPTION: Creates a red rectangular region at (313, 117) spanning 113 by 24 pixels.
; PLAN: r0=313(x), r1=117(y), r2=113(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 117
LDI r2, 113
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
