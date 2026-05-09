; DESCRIPTION: Renders a cyan line between points (13, 35) and (199, 72).
; PLAN: r0=13(x1), r1=35(y1), r2=199(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 35
LDI r2, 199
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
