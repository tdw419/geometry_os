; DESCRIPTION: Renders a cyan line between points (504, 180) and (74, 175).
; PLAN: r0=504(x1), r1=180(y1), r2=74(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 180
LDI r2, 74
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
