; DESCRIPTION: Composite: . Then Draws a green line from (166, 205) to (168, 141). Then Draws a yellow circle centered at (61, 59) with radius 41.
; PLAN: r0=166(x1), r1=205(y1), r2=168(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=59(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (166, 205) to (168, 141).
; PLAN: r0=166(x1), r1=205(y1), r2=168(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 205
LDI r2, 168
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (61, 59) with radius 41.
; PLAN: r0=61(x), r1=59(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 59
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
