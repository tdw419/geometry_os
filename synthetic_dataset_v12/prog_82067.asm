; DESCRIPTION: Places a purple 105x68 rectangle at position (391, 91).
; PLAN: r0=391(x), r1=91(y), r2=105(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 91
LDI r2, 105
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
