; DESCRIPTION: Draws a cyan line from (435, 53) to (240, 66).
; PLAN: r0=435(x1), r1=53(y1), r2=240(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 53
LDI r2, 240
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
