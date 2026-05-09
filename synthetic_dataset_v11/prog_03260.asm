; DESCRIPTION: Places a blue 71x74 rectangle at position (79, 35).
; PLAN: r0=79(x), r1=35(y), r2=71(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 35
LDI r2, 71
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
