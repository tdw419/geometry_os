; DESCRIPTION: Renders a cyan line between points (439, 183) and (96, 39).
; PLAN: r0=439(x1), r1=183(y1), r2=96(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 183
LDI r2, 96
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
