; DESCRIPTION: Draws a black line from (42, 182) to (130, 91).
; PLAN: r0=42(x1), r1=182(y1), r2=130(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 182
LDI r2, 130
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
