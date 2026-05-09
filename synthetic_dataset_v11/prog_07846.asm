; DESCRIPTION: Places a red 44x105 rectangle at position (143, 89).
; PLAN: r0=143(x), r1=89(y), r2=44(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 89
LDI r2, 44
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
