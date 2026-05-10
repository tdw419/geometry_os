; DESCRIPTION: Places a red 101x20 rectangle at position (71, 26).
; PLAN: r0=71(x), r1=26(y), r2=101(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 26
LDI r2, 101
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
