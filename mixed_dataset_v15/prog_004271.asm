; DESCRIPTION: Draws a cyan line from (189, 175) to (240, 12).
; PLAN: r0=189(x1), r1=175(y1), r2=240(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 175
LDI r2, 240
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
