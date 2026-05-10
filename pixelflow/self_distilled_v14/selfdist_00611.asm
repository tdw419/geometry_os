; DESCRIPTION: Places a white 102x57 box at position (0, 162).
; PLAN: r0=0(x), r1=162(y), r2=102(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 162
LDI r2, 102
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
