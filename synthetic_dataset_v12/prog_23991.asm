; DESCRIPTION: Renders a cyan line between points (258, 100) and (243, 95).
; PLAN: r0=258(x1), r1=100(y1), r2=243(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 100
LDI r2, 243
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
