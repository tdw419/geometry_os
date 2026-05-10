; DESCRIPTION: Places a green 18x44 rectangle at position (166, 84).
; PLAN: r0=166(x), r1=84(y), r2=18(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 84
LDI r2, 18
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
