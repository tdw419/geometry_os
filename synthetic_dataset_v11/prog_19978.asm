; DESCRIPTION: Places a cyan 51x85 rectangle at position (155, 36).
; PLAN: r0=155(x), r1=36(y), r2=51(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 36
LDI r2, 51
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
