; DESCRIPTION: Draws a cyan line from (10, 80) to (398, 207).
; PLAN: r0=10(x1), r1=80(y1), r2=398(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 80
LDI r2, 398
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
