; DESCRIPTION: Renders a yellow line between points (256, 205) and (243, 29).
; PLAN: r0=256(x1), r1=205(y1), r2=243(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 205
LDI r2, 243
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
