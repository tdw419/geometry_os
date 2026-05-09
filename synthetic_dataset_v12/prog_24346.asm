; DESCRIPTION: Creates a red rectangular region at (111, 131) spanning 18 by 107 pixels.
; PLAN: r0=111(x), r1=131(y), r2=18(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 131
LDI r2, 18
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
