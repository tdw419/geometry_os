; DESCRIPTION: Renders a cyan line between points (22, 38) and (17, 166).
; PLAN: r0=22(x1), r1=38(y1), r2=17(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 38
LDI r2, 17
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
