; DESCRIPTION: Renders a cyan line between points (19, 190) and (126, 51).
; PLAN: r0=19(x1), r1=190(y1), r2=126(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 190
LDI r2, 126
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
