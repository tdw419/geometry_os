; DESCRIPTION: Places a red 26x33 rectangle at position (81, 3).
; PLAN: r0=81(x), r1=3(y), r2=26(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 3
LDI r2, 26
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
