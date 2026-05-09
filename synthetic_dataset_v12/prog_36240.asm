; DESCRIPTION: Renders a black line between points (173, 161) and (146, 139).
; PLAN: r0=173(x1), r1=161(y1), r2=146(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 161
LDI r2, 146
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
