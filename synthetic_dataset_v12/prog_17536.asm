; DESCRIPTION: Draws a cyan line from (435, 160) to (277, 20).
; PLAN: r0=435(x1), r1=160(y1), r2=277(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 160
LDI r2, 277
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
