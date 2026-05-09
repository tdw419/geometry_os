; DESCRIPTION: Places a red 100x73 rectangle at position (195, 95).
; PLAN: r0=195(x), r1=95(y), r2=100(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 95
LDI r2, 100
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
