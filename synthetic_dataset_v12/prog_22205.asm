; DESCRIPTION: Creates a red rectangular region at (285, 82) spanning 101 by 68 pixels.
; PLAN: r0=285(x), r1=82(y), r2=101(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 82
LDI r2, 101
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
