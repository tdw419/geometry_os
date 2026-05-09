; DESCRIPTION: Places a red 17x40 rectangle at position (116, 96).
; PLAN: r0=116(x), r1=96(y), r2=17(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 96
LDI r2, 17
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
