; DESCRIPTION: Places a white 51x103 rectangle at position (249, 29).
; PLAN: r0=249(x), r1=29(y), r2=51(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 29
LDI r2, 51
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
