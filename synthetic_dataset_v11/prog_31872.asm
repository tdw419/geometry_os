; DESCRIPTION: Renders a cyan line between points (97, 26) and (154, 7).
; PLAN: r0=97(x1), r1=26(y1), r2=154(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 26
LDI r2, 154
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
