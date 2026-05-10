; DESCRIPTION: Places a red 114x83 rectangle at position (269, 118).
; PLAN: r0=269(x), r1=118(y), r2=114(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 118
LDI r2, 114
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
