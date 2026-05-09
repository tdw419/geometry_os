; DESCRIPTION: Places a red 53x44 rectangle at position (246, 8).
; PLAN: r0=246(x), r1=8(y), r2=53(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 8
LDI r2, 53
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
