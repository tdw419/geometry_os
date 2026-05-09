; DESCRIPTION: Renders a cyan line between points (56, 233) and (243, 150).
; PLAN: r0=56(x1), r1=233(y1), r2=243(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 233
LDI r2, 243
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
