; DESCRIPTION: Draws a green line from (30, 243) to (445, 91).
; PLAN: r0=30(x1), r1=243(y1), r2=445(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 243
LDI r2, 445
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
