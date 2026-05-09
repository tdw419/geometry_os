; DESCRIPTION: Draws a yellow line from (465, 54) to (487, 26).
; PLAN: r0=465(x1), r1=54(y1), r2=487(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 54
LDI r2, 487
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
