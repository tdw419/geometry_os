; DESCRIPTION: Places a red line segment connecting (243, 154) to (197, 207).
; PLAN: r0=243(x1), r1=154(y1), r2=197(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 154
LDI r2, 197
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
