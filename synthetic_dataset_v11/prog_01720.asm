; DESCRIPTION: Places a white 101x58 rectangle at position (122, 177).
; PLAN: r0=122(x), r1=177(y), r2=101(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 177
LDI r2, 101
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
