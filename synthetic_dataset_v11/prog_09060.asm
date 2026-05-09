; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (41, 17). Then Draws a yellow line from (206, 105) to (124, 69).
; PLAN: r0=41(x), r1=17(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=206(x1), r1=105(y1), r2=124(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (41, 17).
; PLAN: r0=41(x), r1=17(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 17
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (206, 105) to (124, 69).
; PLAN: r0=206(x1), r1=105(y1), r2=124(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 105
LDI r2, 124
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
