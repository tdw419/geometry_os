; DESCRIPTION: Renders a cyan line between points (392, 41) and (223, 139).
; PLAN: r0=392(x1), r1=41(y1), r2=223(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 41
LDI r2, 223
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
