; DESCRIPTION: Places a blue 99x104 box at position (286, 43).
; PLAN: r0=286(x), r1=43(y), r2=99(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 43
LDI r2, 99
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
