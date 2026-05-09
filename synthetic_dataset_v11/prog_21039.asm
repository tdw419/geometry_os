; DESCRIPTION: Places a yellow 18x119 rectangle at position (12, 127).
; PLAN: r0=12(x), r1=127(y), r2=18(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 127
LDI r2, 18
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
