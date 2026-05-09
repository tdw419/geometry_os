; DESCRIPTION: Places a black 22x13 rectangle at position (398, 20).
; PLAN: r0=398(x), r1=20(y), r2=22(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 20
LDI r2, 22
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
