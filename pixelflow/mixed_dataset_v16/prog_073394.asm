; DESCRIPTION: Places a green 95x83 rectangle at position (253, 170).
; PLAN: r0=253(x), r1=170(y), r2=95(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 170
LDI r2, 95
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
