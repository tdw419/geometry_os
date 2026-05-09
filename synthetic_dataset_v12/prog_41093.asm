; DESCRIPTION: Places a green 75x73 rectangle at position (170, 87).
; PLAN: r0=170(x), r1=87(y), r2=75(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 87
LDI r2, 75
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
