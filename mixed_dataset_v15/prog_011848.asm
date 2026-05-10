; DESCRIPTION: Places a white 83x118 rectangle at position (368, 0).
; PLAN: r0=368(x), r1=0(y), r2=83(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 0
LDI r2, 83
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
