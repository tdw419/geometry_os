; DESCRIPTION: Places a yellow 85x98 rectangle at position (100, 74).
; PLAN: r0=100(x), r1=74(y), r2=85(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 74
LDI r2, 85
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
