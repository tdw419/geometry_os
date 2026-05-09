; DESCRIPTION: Creates a red rectangular region at (207, 171) spanning 102 by 25 pixels.
; PLAN: r0=207(x), r1=171(y), r2=102(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 171
LDI r2, 102
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
