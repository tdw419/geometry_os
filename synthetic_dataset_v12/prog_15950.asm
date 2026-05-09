; DESCRIPTION: Renders a cyan line between points (282, 44) and (57, 207).
; PLAN: r0=282(x1), r1=44(y1), r2=57(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 44
LDI r2, 57
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
