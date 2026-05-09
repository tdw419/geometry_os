; DESCRIPTION: Places a red 106x47 rectangle at position (52, 67).
; PLAN: r0=52(x), r1=67(y), r2=106(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 67
LDI r2, 106
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
