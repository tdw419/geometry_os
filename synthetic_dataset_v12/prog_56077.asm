; DESCRIPTION: Renders a green line between points (398, 33) and (107, 30).
; PLAN: r0=398(x1), r1=33(y1), r2=107(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 33
LDI r2, 107
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
