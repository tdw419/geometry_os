; DESCRIPTION: Composite: . Then Places a cyan 23x72 rectangle at position (5, 9). Then Renders a cyan line between points (254, 198) and (177, 89).
; PLAN: r0=5(x), r1=9(y), r2=23(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=254(x1), r1=198(y1), r2=177(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan 23x72 rectangle at position (5, 9).
; PLAN: r0=5(x), r1=9(y), r2=23(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 9
LDI r2, 23
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (254, 198) and (177, 89).
; PLAN: r0=254(x1), r1=198(y1), r2=177(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 198
LDI r2, 177
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
