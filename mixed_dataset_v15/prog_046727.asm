; DESCRIPTION: Places a black 36x51 rectangle at position (95, 166).
; PLAN: r0=95(x), r1=166(y), r2=36(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 166
LDI r2, 36
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
