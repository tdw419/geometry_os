; DESCRIPTION: Renders a cyan line between points (20, 40) and (66, 126).
; PLAN: r0=20(x1), r1=40(y1), r2=66(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 40
LDI r2, 66
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
