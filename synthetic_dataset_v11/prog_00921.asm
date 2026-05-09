; DESCRIPTION: Places a red 68x79 rectangle at position (55, 67).
; PLAN: r0=55(x), r1=67(y), r2=68(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 67
LDI r2, 68
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
