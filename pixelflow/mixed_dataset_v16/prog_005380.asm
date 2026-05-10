; DESCRIPTION: Places a black 22x60 rectangle at position (350, 8).
; PLAN: r0=350(x), r1=8(y), r2=22(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 8
LDI r2, 22
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
