; DESCRIPTION: Places a blue 17x77 rectangle at position (424, 40).
; PLAN: r0=424(x), r1=40(y), r2=17(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 40
LDI r2, 17
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
