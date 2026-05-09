; DESCRIPTION: Places a green 33x70 rectangle at position (4, 114).
; PLAN: r0=4(x), r1=114(y), r2=33(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 114
LDI r2, 33
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
