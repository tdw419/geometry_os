; DESCRIPTION: Places a green 83x24 rectangle at position (356, 1).
; PLAN: r0=356(x), r1=1(y), r2=83(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 1
LDI r2, 83
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
