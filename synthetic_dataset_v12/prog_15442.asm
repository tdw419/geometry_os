; DESCRIPTION: Renders a cyan line between points (287, 237) and (440, 190).
; PLAN: r0=287(x1), r1=237(y1), r2=440(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 237
LDI r2, 440
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
