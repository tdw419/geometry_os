; DESCRIPTION: Places a yellow 85x101 rectangle at position (25, 29).
; PLAN: r0=25(x), r1=29(y), r2=85(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 29
LDI r2, 85
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
