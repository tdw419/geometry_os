; DESCRIPTION: Places a blue 73x106 rectangle at position (292, 14).
; PLAN: r0=292(x), r1=14(y), r2=73(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 14
LDI r2, 73
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
