; DESCRIPTION: Creates a red rectangular region at (131, 114) spanning 109 by 80 pixels.
; PLAN: r0=131(x), r1=114(y), r2=109(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 114
LDI r2, 109
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
