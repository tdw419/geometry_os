; DESCRIPTION: Renders a cyan line between points (6, 202) and (73, 150).
; PLAN: r0=6(x1), r1=202(y1), r2=73(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 202
LDI r2, 73
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
