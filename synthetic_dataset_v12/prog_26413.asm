; DESCRIPTION: Renders a red line between points (333, 31) and (393, 28).
; PLAN: r0=333(x1), r1=31(y1), r2=393(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 31
LDI r2, 393
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
