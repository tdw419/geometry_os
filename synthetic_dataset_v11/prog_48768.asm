; DESCRIPTION: Places a red 65x53 rectangle at position (84, 82).
; PLAN: r0=84(x), r1=82(y), r2=65(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 82
LDI r2, 65
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
