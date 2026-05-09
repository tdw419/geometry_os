; DESCRIPTION: Places a red 74x30 rectangle at position (16, 129).
; PLAN: r0=16(x), r1=129(y), r2=74(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 129
LDI r2, 74
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
