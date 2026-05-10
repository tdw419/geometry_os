; DESCRIPTION: Places a red 29x23 rectangle at position (51, 39).
; PLAN: r0=51(x), r1=39(y), r2=29(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 39
LDI r2, 29
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
