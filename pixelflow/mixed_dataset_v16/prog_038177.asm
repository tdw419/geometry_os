; DESCRIPTION: Draws a yellow line from (31, 27) to (298, 172).
; PLAN: r0=31(x1), r1=27(y1), r2=298(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 27
LDI r2, 298
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
