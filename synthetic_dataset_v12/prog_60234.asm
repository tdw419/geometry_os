; DESCRIPTION: Places a green 51x13 rectangle at position (279, 170).
; PLAN: r0=279(x), r1=170(y), r2=51(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 170
LDI r2, 51
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
