; DESCRIPTION: Places a magenta 51x40 rectangle at position (408, 17).
; PLAN: r0=408(x), r1=17(y), r2=51(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 17
LDI r2, 51
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
