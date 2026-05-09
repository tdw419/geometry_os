; DESCRIPTION: Renders a cyan line between points (92, 106) and (499, 38).
; PLAN: r0=92(x1), r1=106(y1), r2=499(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 106
LDI r2, 499
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
