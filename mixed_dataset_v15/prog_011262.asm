; DESCRIPTION: Places a red 29x59 box at position (93, 74).
; PLAN: r0=93(x), r1=74(y), r2=29(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 74
LDI r2, 29
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
