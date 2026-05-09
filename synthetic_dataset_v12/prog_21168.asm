; DESCRIPTION: Places a cyan 17x110 rectangle at position (181, 40).
; PLAN: r0=181(x), r1=40(y), r2=17(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 40
LDI r2, 17
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
