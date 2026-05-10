; DESCRIPTION: Places a red 51x12 box at position (190, 181).
; PLAN: r0=190(x), r1=181(y), r2=51(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 181
LDI r2, 51
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
