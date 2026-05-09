; DESCRIPTION: Places a red 57x73 rectangle at position (246, 81).
; PLAN: r0=246(x), r1=81(y), r2=57(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 81
LDI r2, 57
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
