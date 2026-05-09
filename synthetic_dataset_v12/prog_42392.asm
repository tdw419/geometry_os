; DESCRIPTION: Renders a cyan line between points (340, 233) and (394, 251).
; PLAN: r0=340(x1), r1=233(y1), r2=394(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 233
LDI r2, 394
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
