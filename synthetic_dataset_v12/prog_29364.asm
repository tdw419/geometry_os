; DESCRIPTION: Places a green 58x51 rectangle at position (33, 52).
; PLAN: r0=33(x), r1=52(y), r2=58(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 52
LDI r2, 58
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
