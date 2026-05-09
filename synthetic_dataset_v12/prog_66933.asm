; DESCRIPTION: Places a magenta 92x115 rectangle at position (51, 139).
; PLAN: r0=51(x), r1=139(y), r2=92(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 139
LDI r2, 92
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
