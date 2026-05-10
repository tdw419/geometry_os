; DESCRIPTION: Places a red 75x74 rectangle at position (38, 106).
; PLAN: r0=38(x), r1=106(y), r2=75(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 106
LDI r2, 75
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
