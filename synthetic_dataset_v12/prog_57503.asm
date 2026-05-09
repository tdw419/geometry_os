; DESCRIPTION: Renders a cyan line between points (263, 73) and (495, 54).
; PLAN: r0=263(x1), r1=73(y1), r2=495(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 73
LDI r2, 495
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
