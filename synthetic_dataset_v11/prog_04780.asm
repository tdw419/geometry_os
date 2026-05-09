; DESCRIPTION: Places a white 52x51 rectangle at position (57, 199).
; PLAN: r0=57(x), r1=199(y), r2=52(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 199
LDI r2, 52
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
