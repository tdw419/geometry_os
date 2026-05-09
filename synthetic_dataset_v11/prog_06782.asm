; DESCRIPTION: Places a red 95x103 rectangle at position (25, 118).
; PLAN: r0=25(x), r1=118(y), r2=95(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 118
LDI r2, 95
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
