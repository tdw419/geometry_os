; DESCRIPTION: Places a black 51x56 rectangle at position (344, 95).
; PLAN: r0=344(x), r1=95(y), r2=51(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 95
LDI r2, 51
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
