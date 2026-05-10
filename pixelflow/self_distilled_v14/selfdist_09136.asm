; DESCRIPTION: Places a red 93x69 box at position (67, 196).
; PLAN: r0=67(x), r1=196(y), r2=93(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 196
LDI r2, 93
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
