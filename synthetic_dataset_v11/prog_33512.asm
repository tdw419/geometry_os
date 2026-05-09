; DESCRIPTION: Renders a green line between points (162, 146) and (126, 195).
; PLAN: r0=162(x1), r1=146(y1), r2=126(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 146
LDI r2, 126
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
