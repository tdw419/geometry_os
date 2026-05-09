; DESCRIPTION: Renders a cyan line between points (197, 7) and (458, 186).
; PLAN: r0=197(x1), r1=7(y1), r2=458(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 7
LDI r2, 458
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
