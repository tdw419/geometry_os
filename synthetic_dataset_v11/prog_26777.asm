; DESCRIPTION: Composite: . Then Draws a yellow line from (48, 233) to (205, 138). Then Places a orange dot at position (86, 9).
; PLAN: r0=48(x1), r1=233(y1), r2=205(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=86(x), r1=9(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow line from (48, 233) to (205, 138).
; PLAN: r0=48(x1), r1=233(y1), r2=205(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 233
LDI r2, 205
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (86, 9).
; PLAN: r0=86(x), r1=9(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 9
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
