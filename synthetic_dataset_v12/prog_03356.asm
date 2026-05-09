; DESCRIPTION: Places a green 22x89 rectangle at position (121, 19).
; PLAN: r0=121(x), r1=19(y), r2=22(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 19
LDI r2, 22
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
