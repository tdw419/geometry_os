; DESCRIPTION: Places a yellow 56x89 rectangle at position (4, 112).
; PLAN: r0=4(x), r1=112(y), r2=56(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 112
LDI r2, 56
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
