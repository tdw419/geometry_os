; DESCRIPTION: Places a yellow 79x98 rectangle at position (15, 114).
; PLAN: r0=15(x), r1=114(y), r2=79(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 114
LDI r2, 79
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
