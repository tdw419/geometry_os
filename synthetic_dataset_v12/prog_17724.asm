; DESCRIPTION: Renders a cyan line between points (197, 197) and (27, 77).
; PLAN: r0=197(x1), r1=197(y1), r2=27(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 197
LDI r2, 27
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
