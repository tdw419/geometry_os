; DESCRIPTION: Places a red 18x102 rectangle at position (342, 145).
; PLAN: r0=342(x), r1=145(y), r2=18(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 145
LDI r2, 18
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
