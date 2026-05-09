; DESCRIPTION: Places a white 51x77 rectangle at position (157, 2).
; PLAN: r0=157(x), r1=2(y), r2=51(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 2
LDI r2, 51
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
