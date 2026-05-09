; DESCRIPTION: Places a red 19x103 rectangle at position (190, 141).
; PLAN: r0=190(x), r1=141(y), r2=19(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 141
LDI r2, 19
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
