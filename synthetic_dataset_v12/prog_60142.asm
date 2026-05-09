; DESCRIPTION: Renders a cyan line between points (180, 202) and (395, 241).
; PLAN: r0=180(x1), r1=202(y1), r2=395(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 202
LDI r2, 395
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
