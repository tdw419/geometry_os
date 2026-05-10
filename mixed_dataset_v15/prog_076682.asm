; DESCRIPTION: Places a red 102x80 rectangle at position (348, 65).
; PLAN: r0=348(x), r1=65(y), r2=102(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 65
LDI r2, 102
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
