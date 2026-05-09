; DESCRIPTION: Renders a cyan line between points (366, 117) and (245, 126).
; PLAN: r0=366(x1), r1=117(y1), r2=245(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 117
LDI r2, 245
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
