; DESCRIPTION: Places a green 40x26 rectangle at position (180, 114).
; PLAN: r0=180(x), r1=114(y), r2=40(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 114
LDI r2, 40
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
