; DESCRIPTION: Draws a cyan line from (207, 190) to (371, 216).
; PLAN: r0=207(x1), r1=190(y1), r2=371(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 190
LDI r2, 371
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
