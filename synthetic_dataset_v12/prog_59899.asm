; DESCRIPTION: Renders a green line between points (415, 206) and (234, 187).
; PLAN: r0=415(x1), r1=206(y1), r2=234(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 206
LDI r2, 234
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
