; DESCRIPTION: Places a white 57x63 rectangle at position (51, 180).
; PLAN: r0=51(x), r1=180(y), r2=57(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 180
LDI r2, 57
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
