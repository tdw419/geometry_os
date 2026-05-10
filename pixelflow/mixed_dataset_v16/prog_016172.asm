; DESCRIPTION: Places a red 12x33 rectangle at position (102, 78).
; PLAN: r0=102(x), r1=78(y), r2=12(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 78
LDI r2, 12
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
