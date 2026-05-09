; DESCRIPTION: Places a green 50x114 rectangle at position (44, 80).
; PLAN: r0=44(x), r1=80(y), r2=50(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 80
LDI r2, 50
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
