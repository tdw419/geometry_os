; DESCRIPTION: Places a red 56x103 rectangle at position (430, 132).
; PLAN: r0=430(x), r1=132(y), r2=56(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 132
LDI r2, 56
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
