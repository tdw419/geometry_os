; DESCRIPTION: Places a yellow 85x94 rectangle at position (69, 119).
; PLAN: r0=69(x), r1=119(y), r2=85(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 119
LDI r2, 85
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
