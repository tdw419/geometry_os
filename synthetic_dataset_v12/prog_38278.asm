; DESCRIPTION: Renders a cyan line between points (25, 84) and (465, 64).
; PLAN: r0=25(x1), r1=84(y1), r2=465(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 84
LDI r2, 465
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
