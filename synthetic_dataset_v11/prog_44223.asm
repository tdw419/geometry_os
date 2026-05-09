; DESCRIPTION: Composite: . Then Draws a black line from (59, 78) to (126, 98). Then Draws a purple circle centered at (193, 138) with radius 27.
; PLAN: r0=59(x1), r1=78(y1), r2=126(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=193(x), r1=138(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (59, 78) to (126, 98).
; PLAN: r0=59(x1), r1=78(y1), r2=126(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 78
LDI r2, 126
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (193, 138) with radius 27.
; PLAN: r0=193(x), r1=138(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 138
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
