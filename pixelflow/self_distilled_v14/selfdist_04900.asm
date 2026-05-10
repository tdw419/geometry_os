; DESCRIPTION: Places a red 79x33 box at position (55, 53).
; PLAN: r0=55(x), r1=53(y), r2=79(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 53
LDI r2, 79
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
