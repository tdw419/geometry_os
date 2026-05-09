; DESCRIPTION: Renders a cyan line between points (27, 27) and (442, 190).
; PLAN: r0=27(x1), r1=27(y1), r2=442(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 27
LDI r2, 442
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
