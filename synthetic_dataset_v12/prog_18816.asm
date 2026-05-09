; DESCRIPTION: Places a green 22x72 rectangle at position (87, 44).
; PLAN: r0=87(x), r1=44(y), r2=22(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 44
LDI r2, 22
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
