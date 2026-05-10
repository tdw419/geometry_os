; DESCRIPTION: Renders a green line between points (467, 144) and (386, 9).
; PLAN: r0=467(x1), r1=144(y1), r2=386(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 144
LDI r2, 386
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
