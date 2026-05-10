; DESCRIPTION: Places a magenta 61x95 box at position (285, 43).
; PLAN: r0=285(x), r1=43(y), r2=61(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 43
LDI r2, 61
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
