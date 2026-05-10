; DESCRIPTION: Places a magenta 51x50 rectangle at position (420, 137).
; PLAN: r0=420(x), r1=137(y), r2=51(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 137
LDI r2, 51
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
