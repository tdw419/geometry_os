; DESCRIPTION: Places a red 115x68 rectangle at position (129, 60).
; PLAN: r0=129(x), r1=60(y), r2=115(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 60
LDI r2, 115
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
