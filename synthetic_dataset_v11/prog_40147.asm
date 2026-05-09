; DESCRIPTION: Places a green 89x63 rectangle at position (148, 112).
; PLAN: r0=148(x), r1=112(y), r2=89(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 112
LDI r2, 89
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
