; DESCRIPTION: Places a red 23x115 rectangle at position (118, 91).
; PLAN: r0=118(x), r1=91(y), r2=23(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 91
LDI r2, 23
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
