; DESCRIPTION: Renders a green line between points (330, 30) and (50, 208).
; PLAN: r0=330(x1), r1=30(y1), r2=50(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 30
LDI r2, 50
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
