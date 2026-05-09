; DESCRIPTION: Places a green 116x95 rectangle at position (341, 93).
; PLAN: r0=341(x), r1=93(y), r2=116(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 93
LDI r2, 116
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
