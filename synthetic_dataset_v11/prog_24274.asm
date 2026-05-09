; DESCRIPTION: Places a white 58x74 rectangle at position (107, 138).
; PLAN: r0=107(x), r1=138(y), r2=58(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 138
LDI r2, 58
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
