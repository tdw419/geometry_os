; DESCRIPTION: Places a green 37x59 rectangle at position (179, 140).
; PLAN: r0=179(x), r1=140(y), r2=37(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 140
LDI r2, 37
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
