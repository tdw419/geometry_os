; DESCRIPTION: Places a red 102x85 rectangle at position (341, 51).
; PLAN: r0=341(x), r1=51(y), r2=102(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 51
LDI r2, 102
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
