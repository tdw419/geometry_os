; DESCRIPTION: Composite: . Then Places a orange 58x10 rectangle at position (106, 45). Then Renders a orange line between points (106, 33) and (41, 174).
; PLAN: r0=106(x), r1=45(y), r2=58(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=106(x1), r1=33(y1), r2=41(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange 58x10 rectangle at position (106, 45).
; PLAN: r0=106(x), r1=45(y), r2=58(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 45
LDI r2, 58
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (106, 33) and (41, 174).
; PLAN: r0=106(x1), r1=33(y1), r2=41(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 33
LDI r2, 41
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
