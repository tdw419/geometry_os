; DESCRIPTION: Places a red 35x72 box at position (135, 53).
; PLAN: r0=135(x), r1=53(y), r2=35(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 53
LDI r2, 35
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
