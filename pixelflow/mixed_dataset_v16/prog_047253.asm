; DESCRIPTION: Places a magenta 102x43 box at position (102, 137).
; PLAN: r0=102(x), r1=137(y), r2=102(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 137
LDI r2, 102
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
