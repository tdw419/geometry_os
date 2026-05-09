; DESCRIPTION: Draws a cyan line from (22, 233) to (175, 117).
; PLAN: r0=22(x1), r1=233(y1), r2=175(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 233
LDI r2, 175
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
