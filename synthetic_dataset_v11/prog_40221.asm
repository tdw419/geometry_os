; DESCRIPTION: Places a white 51x117 rectangle at position (107, 76).
; PLAN: r0=107(x), r1=76(y), r2=51(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 76
LDI r2, 51
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
