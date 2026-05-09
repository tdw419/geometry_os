; DESCRIPTION: Places a cyan 51x56 rectangle at position (138, 11).
; PLAN: r0=138(x), r1=11(y), r2=51(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 11
LDI r2, 51
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
