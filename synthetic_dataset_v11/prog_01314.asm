; DESCRIPTION: Places a yellow 101x51 rectangle at position (57, 196).
; PLAN: r0=57(x), r1=196(y), r2=101(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 196
LDI r2, 101
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
