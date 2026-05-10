; DESCRIPTION: Renders a red rectangular region spanning 117 by 60 at (313, 37).
; PLAN: r0=313(x), r1=37(y), r2=117(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 37
LDI r2, 117
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
