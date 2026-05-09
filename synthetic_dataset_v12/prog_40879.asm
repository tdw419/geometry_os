; DESCRIPTION: Renders a cyan line between points (3, 237) and (470, 11).
; PLAN: r0=3(x1), r1=237(y1), r2=470(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 237
LDI r2, 470
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
