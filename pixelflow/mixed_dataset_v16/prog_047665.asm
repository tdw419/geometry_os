; DESCRIPTION: Renders a cyan line between points (374, 127) and (288, 11).
; PLAN: r0=374(x1), r1=127(y1), r2=288(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 127
LDI r2, 288
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
