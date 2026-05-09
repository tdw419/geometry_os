; DESCRIPTION: Composite: . Then Places a black 105x45 rectangle at position (41, 15). Then Renders a red line between points (72, 199) and (172, 66).
; PLAN: r0=41(x), r1=15(y), r2=105(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=72(x1), r1=199(y1), r2=172(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 105x45 rectangle at position (41, 15).
; PLAN: r0=41(x), r1=15(y), r2=105(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 15
LDI r2, 105
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (72, 199) and (172, 66).
; PLAN: r0=72(x1), r1=199(y1), r2=172(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 199
LDI r2, 172
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
