; DESCRIPTION: Places a cyan line segment connecting (51, 249) to (393, 91).
; PLAN: r0=51(x1), r1=249(y1), r2=393(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 249
LDI r2, 393
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
