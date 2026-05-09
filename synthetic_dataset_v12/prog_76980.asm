; DESCRIPTION: Places a green 116x37 rectangle at position (265, 144).
; PLAN: r0=265(x), r1=144(y), r2=116(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 144
LDI r2, 116
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
