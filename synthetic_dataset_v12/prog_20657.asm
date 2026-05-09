; DESCRIPTION: Places a black 51x39 rectangle at position (101, 192).
; PLAN: r0=101(x), r1=192(y), r2=51(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 192
LDI r2, 51
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
