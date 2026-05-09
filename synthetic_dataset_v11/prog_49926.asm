; DESCRIPTION: Draws a cyan line from (91, 36) to (175, 178).
; PLAN: r0=91(x1), r1=36(y1), r2=175(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 36
LDI r2, 175
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
