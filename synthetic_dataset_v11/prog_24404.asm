; DESCRIPTION: Composite: . Then Renders a green line between points (63, 160) and (159, 171). Then Places a orange 41x58 rectangle at position (50, 117).
; PLAN: r0=63(x1), r1=160(y1), r2=159(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=50(x), r1=117(y), r2=41(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (63, 160) and (159, 171).
; PLAN: r0=63(x1), r1=160(y1), r2=159(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 160
LDI r2, 159
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 41x58 rectangle at position (50, 117).
; PLAN: r0=50(x), r1=117(y), r2=41(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 117
LDI r2, 41
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
