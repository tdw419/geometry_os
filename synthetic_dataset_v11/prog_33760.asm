; DESCRIPTION: Places a yellow 117x89 rectangle at position (103, 50).
; PLAN: r0=103(x), r1=50(y), r2=117(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 50
LDI r2, 117
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
