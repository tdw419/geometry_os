; DESCRIPTION: Places a white 89x117 rectangle at position (34, 125).
; PLAN: r0=34(x), r1=125(y), r2=89(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 125
LDI r2, 89
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
