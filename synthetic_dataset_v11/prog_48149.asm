; DESCRIPTION: Composite: . Then Draws a orange line from (137, 64) to (41, 232). Then Places a yellow 27x83 rectangle at position (207, 130).
; PLAN: r0=137(x1), r1=64(y1), r2=41(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=207(x), r1=130(y), r2=27(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (137, 64) to (41, 232).
; PLAN: r0=137(x1), r1=64(y1), r2=41(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 64
LDI r2, 41
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 27x83 rectangle at position (207, 130).
; PLAN: r0=207(x), r1=130(y), r2=27(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 130
LDI r2, 27
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
