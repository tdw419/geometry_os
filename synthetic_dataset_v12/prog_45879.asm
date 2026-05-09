; DESCRIPTION: Renders a cyan line between points (440, 159) and (291, 15).
; PLAN: r0=440(x1), r1=159(y1), r2=291(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 159
LDI r2, 291
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
