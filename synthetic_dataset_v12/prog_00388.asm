; DESCRIPTION: Places a yellow 22x31 rectangle at position (391, 53).
; PLAN: r0=391(x), r1=53(y), r2=22(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 53
LDI r2, 22
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
