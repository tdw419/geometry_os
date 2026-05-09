; DESCRIPTION: Places a green 54x58 rectangle at position (159, 124).
; PLAN: r0=159(x), r1=124(y), r2=54(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 124
LDI r2, 54
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
