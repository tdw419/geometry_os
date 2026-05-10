; DESCRIPTION: Places a white 68x76 box at position (309, 131).
; PLAN: r0=309(x), r1=131(y), r2=68(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 131
LDI r2, 68
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
