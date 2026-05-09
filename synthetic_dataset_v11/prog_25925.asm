; DESCRIPTION: Places a magenta 15x80 rectangle at position (34, 119).
; PLAN: r0=34(x), r1=119(y), r2=15(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 119
LDI r2, 15
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
