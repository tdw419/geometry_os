; DESCRIPTION: Renders a cyan line between points (345, 120) and (144, 173).
; PLAN: r0=345(x1), r1=120(y1), r2=144(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 120
LDI r2, 144
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
