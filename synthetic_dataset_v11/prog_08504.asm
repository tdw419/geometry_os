; DESCRIPTION: Composite: . Then Places a green dot at position (68, 5). Then Draws a black line from (17, 154) to (180, 65).
; PLAN: r0=68(x), r1=5(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=17(x1), r1=154(y1), r2=180(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (68, 5).
; PLAN: r0=68(x), r1=5(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 5
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (17, 154) to (180, 65).
; PLAN: r0=17(x1), r1=154(y1), r2=180(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 154
LDI r2, 180
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
