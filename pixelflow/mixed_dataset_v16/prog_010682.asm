; DESCRIPTION: Places a white 107x120 rectangle at position (227, 131).
; PLAN: r0=227(x), r1=131(y), r2=107(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 131
LDI r2, 107
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
