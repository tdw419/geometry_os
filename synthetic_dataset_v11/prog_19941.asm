; DESCRIPTION: Places a green 49x51 rectangle at position (152, 128).
; PLAN: r0=152(x), r1=128(y), r2=49(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 128
LDI r2, 49
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
