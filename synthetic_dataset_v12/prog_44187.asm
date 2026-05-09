; DESCRIPTION: Draws a cyan line from (394, 233) to (435, 137).
; PLAN: r0=394(x1), r1=233(y1), r2=435(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 233
LDI r2, 435
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
