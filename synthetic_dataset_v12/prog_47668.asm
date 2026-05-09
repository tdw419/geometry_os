; DESCRIPTION: Places a black 51x67 rectangle at position (106, 168).
; PLAN: r0=106(x), r1=168(y), r2=51(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 168
LDI r2, 51
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
