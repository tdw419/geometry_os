; DESCRIPTION: Places a red 47x17 rectangle at position (348, 92).
; PLAN: r0=348(x), r1=92(y), r2=47(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 92
LDI r2, 47
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
