; DESCRIPTION: Places a green 63x47 rectangle at position (170, 114).
; PLAN: r0=170(x), r1=114(y), r2=63(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 114
LDI r2, 63
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
