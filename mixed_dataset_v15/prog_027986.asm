; DESCRIPTION: Draws a black line from (290, 37) to (410, 3).
; PLAN: r0=290(x1), r1=37(y1), r2=410(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 37
LDI r2, 410
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
