; DESCRIPTION: Places a red 45x114 rectangle at position (277, 20).
; PLAN: r0=277(x), r1=20(y), r2=45(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 20
LDI r2, 45
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
