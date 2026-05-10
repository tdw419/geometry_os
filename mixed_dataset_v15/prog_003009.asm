; DESCRIPTION: Places a red 40x69 rectangle at position (137, 112).
; PLAN: r0=137(x), r1=112(y), r2=40(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 112
LDI r2, 40
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
