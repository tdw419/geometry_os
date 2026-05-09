; DESCRIPTION: Renders a cyan line between points (502, 150) and (144, 251).
; PLAN: r0=502(x1), r1=150(y1), r2=144(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 150
LDI r2, 144
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
