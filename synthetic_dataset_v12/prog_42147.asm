; DESCRIPTION: Places a yellow 68x26 rectangle at position (310, 200).
; PLAN: r0=310(x), r1=200(y), r2=68(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 200
LDI r2, 68
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
