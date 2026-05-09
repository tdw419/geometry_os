; DESCRIPTION: Places a red 116x51 rectangle at position (65, 148).
; PLAN: r0=65(x), r1=148(y), r2=116(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 148
LDI r2, 116
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
