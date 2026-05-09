; DESCRIPTION: Draws a yellow line from (365, 98) to (470, 192).
; PLAN: r0=365(x1), r1=98(y1), r2=470(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 98
LDI r2, 470
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
