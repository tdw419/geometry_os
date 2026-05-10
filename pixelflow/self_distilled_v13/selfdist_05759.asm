; DESCRIPTION: Places a yellow 53x102 box at position (179, 92).
; PLAN: r0=179(x), r1=92(y), r2=53(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 92
LDI r2, 53
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
