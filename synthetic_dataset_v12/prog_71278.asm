; DESCRIPTION: Places a white 83x81 rectangle at position (153, 17).
; PLAN: r0=153(x), r1=17(y), r2=83(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 17
LDI r2, 83
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
