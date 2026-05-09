; DESCRIPTION: Renders a green line between points (202, 188) and (171, 16).
; PLAN: r0=202(x1), r1=188(y1), r2=171(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 188
LDI r2, 171
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
