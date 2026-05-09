; DESCRIPTION: Places a black 46x89 rectangle at position (20, 91).
; PLAN: r0=20(x), r1=91(y), r2=46(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 91
LDI r2, 46
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
