; DESCRIPTION: Renders a green line between points (187, 231) and (208, 68).
; PLAN: r0=187(x1), r1=231(y1), r2=208(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 231
LDI r2, 208
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
