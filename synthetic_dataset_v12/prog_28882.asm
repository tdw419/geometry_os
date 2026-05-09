; DESCRIPTION: Places a cyan line segment connecting (385, 220) to (4, 91).
; PLAN: r0=385(x1), r1=220(y1), r2=4(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 220
LDI r2, 4
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
