; DESCRIPTION: Places a magenta 51x53 rectangle at position (105, 166).
; PLAN: r0=105(x), r1=166(y), r2=51(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 166
LDI r2, 51
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
