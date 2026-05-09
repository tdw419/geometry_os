; DESCRIPTION: Draws a green line from (66, 166) to (394, 0).
; PLAN: r0=66(x1), r1=166(y1), r2=394(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 166
LDI r2, 394
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
