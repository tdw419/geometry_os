; DESCRIPTION: Places a green 51x101 rectangle at position (128, 46).
; PLAN: r0=128(x), r1=46(y), r2=51(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 46
LDI r2, 51
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
