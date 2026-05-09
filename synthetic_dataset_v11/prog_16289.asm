; DESCRIPTION: Places a white 51x73 rectangle at position (3, 90).
; PLAN: r0=3(x), r1=90(y), r2=51(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 90
LDI r2, 51
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
