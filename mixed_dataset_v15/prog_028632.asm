; DESCRIPTION: Places a white 56x58 rectangle at position (423, 74).
; PLAN: r0=423(x), r1=74(y), r2=56(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 74
LDI r2, 56
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
