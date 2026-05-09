; DESCRIPTION: Places a red 81x38 rectangle at position (342, 72).
; PLAN: r0=342(x), r1=72(y), r2=81(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 72
LDI r2, 81
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
