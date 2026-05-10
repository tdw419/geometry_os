; DESCRIPTION: Places a red 91x55 box at position (164, 53).
; PLAN: r0=164(x), r1=53(y), r2=91(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 53
LDI r2, 91
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
