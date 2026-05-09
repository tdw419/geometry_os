; DESCRIPTION: Places a yellow 66x67 rectangle at position (79, 93).
; PLAN: r0=79(x), r1=93(y), r2=66(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 93
LDI r2, 66
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
