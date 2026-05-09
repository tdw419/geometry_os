; DESCRIPTION: Renders a green line between points (179, 242) and (54, 103).
; PLAN: r0=179(x1), r1=242(y1), r2=54(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 242
LDI r2, 54
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
