; DESCRIPTION: Places a yellow 60x51 rectangle at position (102, 86).
; PLAN: r0=102(x), r1=86(y), r2=60(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 86
LDI r2, 60
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
