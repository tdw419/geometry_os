; DESCRIPTION: Places a white 57x33 rectangle at position (118, 112).
; PLAN: r0=118(x), r1=112(y), r2=57(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 112
LDI r2, 57
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
