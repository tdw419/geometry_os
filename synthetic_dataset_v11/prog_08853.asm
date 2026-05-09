; DESCRIPTION: Places a green 47x47 rectangle at position (119, 3).
; PLAN: r0=119(x), r1=3(y), r2=47(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 3
LDI r2, 47
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
