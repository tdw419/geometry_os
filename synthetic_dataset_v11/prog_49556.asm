; DESCRIPTION: Places a red 117x57 rectangle at position (103, 179).
; PLAN: r0=103(x), r1=179(y), r2=117(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 179
LDI r2, 117
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
