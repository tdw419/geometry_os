; DESCRIPTION: Renders a white line between points (21, 209) and (243, 153).
; PLAN: r0=21(x1), r1=209(y1), r2=243(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 209
LDI r2, 243
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
