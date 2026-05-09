; DESCRIPTION: Draws a green line from (42, 179) to (468, 91).
; PLAN: r0=42(x1), r1=179(y1), r2=468(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 179
LDI r2, 468
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
