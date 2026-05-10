; DESCRIPTION: Places a red 77x53 box at position (197, 93).
; PLAN: r0=197(x), r1=93(y), r2=77(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 93
LDI r2, 77
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
