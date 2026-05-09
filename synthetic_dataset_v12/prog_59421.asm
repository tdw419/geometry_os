; DESCRIPTION: Places a blue 16x91 rectangle at position (115, 114).
; PLAN: r0=115(x), r1=114(y), r2=16(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 114
LDI r2, 16
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
