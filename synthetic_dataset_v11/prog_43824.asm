; DESCRIPTION: Places a red 96x74 rectangle at position (139, 141).
; PLAN: r0=139(x), r1=141(y), r2=96(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 141
LDI r2, 96
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
