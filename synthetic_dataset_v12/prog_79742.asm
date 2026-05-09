; DESCRIPTION: Places a green 116x17 rectangle at position (226, 137).
; PLAN: r0=226(x), r1=137(y), r2=116(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 137
LDI r2, 116
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
