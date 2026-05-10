; DESCRIPTION: Renders a green line between points (160, 12) and (470, 16).
; PLAN: r0=160(x1), r1=12(y1), r2=470(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 12
LDI r2, 470
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
