; DESCRIPTION: Creates a red rectangular region at (285, 131) spanning 90 by 109 pixels.
; PLAN: r0=285(x), r1=131(y), r2=90(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 131
LDI r2, 90
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
