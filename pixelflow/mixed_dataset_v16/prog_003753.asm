; DESCRIPTION: Renders a cyan line between points (8, 80) and (280, 243).
; PLAN: r0=8(x1), r1=80(y1), r2=280(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 80
LDI r2, 280
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
