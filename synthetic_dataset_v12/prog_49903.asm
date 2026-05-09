; DESCRIPTION: Places a red 117x75 rectangle at position (199, 89).
; PLAN: r0=199(x), r1=89(y), r2=117(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 89
LDI r2, 117
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
