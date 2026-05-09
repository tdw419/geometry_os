; DESCRIPTION: Places a white 51x97 rectangle at position (282, 14).
; PLAN: r0=282(x), r1=14(y), r2=51(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 14
LDI r2, 51
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
