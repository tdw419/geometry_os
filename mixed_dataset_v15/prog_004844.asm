; DESCRIPTION: Draws a white line from (8, 75) to (168, 91).
; PLAN: r0=8(x1), r1=75(y1), r2=168(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 75
LDI r2, 168
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
