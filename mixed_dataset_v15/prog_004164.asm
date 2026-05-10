; DESCRIPTION: Places a black 75x29 rectangle at position (17, 48).
; PLAN: r0=17(x), r1=48(y), r2=75(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 48
LDI r2, 75
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
