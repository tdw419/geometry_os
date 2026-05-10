; DESCRIPTION: Places a magenta 96x95 box at position (23, 9).
; PLAN: r0=23(x), r1=9(y), r2=96(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 9
LDI r2, 96
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
