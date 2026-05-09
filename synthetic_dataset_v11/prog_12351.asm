; DESCRIPTION: Renders a cyan line between points (172, 146) and (70, 19).
; PLAN: r0=172(x1), r1=146(y1), r2=70(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 146
LDI r2, 70
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
