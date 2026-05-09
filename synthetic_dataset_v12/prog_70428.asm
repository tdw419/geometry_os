; DESCRIPTION: Renders a cyan line between points (208, 26) and (313, 5).
; PLAN: r0=208(x1), r1=26(y1), r2=313(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 26
LDI r2, 313
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
