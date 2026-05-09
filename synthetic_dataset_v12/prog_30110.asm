; DESCRIPTION: Draws a cyan line from (333, 49) to (175, 11).
; PLAN: r0=333(x1), r1=49(y1), r2=175(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 49
LDI r2, 175
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
