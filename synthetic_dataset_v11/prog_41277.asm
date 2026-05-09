; DESCRIPTION: Places a white 113x106 rectangle at position (93, 12).
; PLAN: r0=93(x), r1=12(y), r2=113(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 12
LDI r2, 113
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
