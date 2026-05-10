; DESCRIPTION: Places a green 51x24 box at position (68, 40).
; PLAN: r0=68(x), r1=40(y), r2=51(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 40
LDI r2, 51
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
