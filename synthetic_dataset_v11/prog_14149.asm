; DESCRIPTION: Renders a cyan line between points (29, 174) and (32, 202).
; PLAN: r0=29(x1), r1=174(y1), r2=32(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 174
LDI r2, 32
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
