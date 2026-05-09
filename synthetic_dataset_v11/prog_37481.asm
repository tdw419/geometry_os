; DESCRIPTION: Renders a green line between points (243, 153) and (165, 236).
; PLAN: r0=243(x1), r1=153(y1), r2=165(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 153
LDI r2, 165
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
