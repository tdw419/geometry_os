; DESCRIPTION: Places a green 12x99 rectangle at position (53, 91).
; PLAN: r0=53(x), r1=91(y), r2=12(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 91
LDI r2, 12
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
