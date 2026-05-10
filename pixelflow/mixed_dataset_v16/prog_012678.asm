; DESCRIPTION: Renders a cyan line between points (36, 127) and (271, 25).
; PLAN: r0=36(x1), r1=127(y1), r2=271(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 127
LDI r2, 271
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
