; DESCRIPTION: Places a green 112x103 rectangle at position (170, 140).
; PLAN: r0=170(x), r1=140(y), r2=112(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 140
LDI r2, 112
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
