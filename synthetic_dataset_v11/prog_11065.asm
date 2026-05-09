; DESCRIPTION: Draws a green line from (149, 104) to (42, 91).
; PLAN: r0=149(x1), r1=104(y1), r2=42(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 104
LDI r2, 42
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
