; DESCRIPTION: Renders a cyan line between points (231, 90) and (460, 135).
; PLAN: r0=231(x1), r1=90(y1), r2=460(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 90
LDI r2, 460
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
