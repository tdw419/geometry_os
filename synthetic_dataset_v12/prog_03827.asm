; DESCRIPTION: Renders a white box of size 57x26 starting at (143, 118).
; PLAN: r0=143(x), r1=118(y), r2=57(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 118
LDI r2, 57
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
