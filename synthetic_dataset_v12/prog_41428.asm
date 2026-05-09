; DESCRIPTION: Places a red 82x106 rectangle at position (323, 53).
; PLAN: r0=323(x), r1=53(y), r2=82(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 53
LDI r2, 82
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
