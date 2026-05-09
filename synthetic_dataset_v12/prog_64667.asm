; DESCRIPTION: Renders a cyan line between points (78, 223) and (279, 167).
; PLAN: r0=78(x1), r1=223(y1), r2=279(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 223
LDI r2, 279
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
