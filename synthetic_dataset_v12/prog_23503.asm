; DESCRIPTION: Places a white 29x96 rectangle at position (141, 4).
; PLAN: r0=141(x), r1=4(y), r2=29(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 4
LDI r2, 29
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
