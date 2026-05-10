; DESCRIPTION: Places a magenta 27x24 box at position (142, 137).
; PLAN: r0=142(x), r1=137(y), r2=27(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 137
LDI r2, 27
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
