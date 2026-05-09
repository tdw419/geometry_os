; DESCRIPTION: Places a white 82x83 rectangle at position (112, 118).
; PLAN: r0=112(x), r1=118(y), r2=82(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 118
LDI r2, 82
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
