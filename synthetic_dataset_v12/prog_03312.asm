; DESCRIPTION: Creates a red rectangular region at (276, 131) spanning 39 by 87 pixels.
; PLAN: r0=276(x), r1=131(y), r2=39(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 131
LDI r2, 39
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
