; DESCRIPTION: Places a yellow 18x76 rectangle at position (132, 0).
; PLAN: r0=132(x), r1=0(y), r2=18(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 0
LDI r2, 18
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
