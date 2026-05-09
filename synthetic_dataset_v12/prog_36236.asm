; DESCRIPTION: Draws a cyan line from (95, 43) to (435, 0).
; PLAN: r0=95(x1), r1=43(y1), r2=435(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 43
LDI r2, 435
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
