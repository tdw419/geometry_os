; DESCRIPTION: Places a yellow 61x108 rectangle at position (22, 91).
; PLAN: r0=22(x), r1=91(y), r2=61(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 91
LDI r2, 61
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
