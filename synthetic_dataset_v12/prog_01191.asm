; DESCRIPTION: Renders a cyan line between points (54, 30) and (277, 167).
; PLAN: r0=54(x1), r1=30(y1), r2=277(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 30
LDI r2, 277
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
