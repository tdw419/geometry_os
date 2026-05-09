; DESCRIPTION: Places a red 50x73 rectangle at position (155, 11).
; PLAN: r0=155(x), r1=11(y), r2=50(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 11
LDI r2, 50
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
