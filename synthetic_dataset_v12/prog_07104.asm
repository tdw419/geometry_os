; DESCRIPTION: Draws a cyan line from (91, 9) to (264, 22).
; PLAN: r0=91(x1), r1=9(y1), r2=264(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 9
LDI r2, 264
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
