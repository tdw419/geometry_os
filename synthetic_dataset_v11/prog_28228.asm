; DESCRIPTION: Places a white 56x117 rectangle at position (75, 118).
; PLAN: r0=75(x), r1=118(y), r2=56(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 118
LDI r2, 56
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
