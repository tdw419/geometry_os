; DESCRIPTION: Places a black 68x63 rectangle at position (40, 91).
; PLAN: r0=40(x), r1=91(y), r2=68(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 91
LDI r2, 68
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
