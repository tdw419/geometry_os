; DESCRIPTION: Composite: . Then Renders a black line between points (87, 226) and (36, 73). Then Places a cyan 73x55 rectangle at position (170, 189).
; PLAN: r0=87(x1), r1=226(y1), r2=36(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=170(x), r1=189(y), r2=73(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (87, 226) and (36, 73).
; PLAN: r0=87(x1), r1=226(y1), r2=36(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 226
LDI r2, 36
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 73x55 rectangle at position (170, 189).
; PLAN: r0=170(x), r1=189(y), r2=73(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 189
LDI r2, 73
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
