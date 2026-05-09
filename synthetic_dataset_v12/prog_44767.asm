; DESCRIPTION: Places a red 102x110 rectangle at position (261, 116).
; PLAN: r0=261(x), r1=116(y), r2=102(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 116
LDI r2, 102
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
