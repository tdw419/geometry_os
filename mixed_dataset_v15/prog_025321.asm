; DESCRIPTION: Renders a green line between points (242, 254) and (116, 127).
; PLAN: r0=242(x1), r1=254(y1), r2=116(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 254
LDI r2, 116
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
