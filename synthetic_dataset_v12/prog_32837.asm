; DESCRIPTION: Places a green 51x105 rectangle at position (8, 2).
; PLAN: r0=8(x), r1=2(y), r2=51(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 2
LDI r2, 51
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
