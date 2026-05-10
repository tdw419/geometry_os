; DESCRIPTION: Creates a white rectangular region at (365, 131) spanning 68 by 101 pixels.
; PLAN: r0=365(x), r1=131(y), r2=68(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 131
LDI r2, 68
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
