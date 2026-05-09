; DESCRIPTION: Draws a cyan line from (307, 190) to (389, 150).
; PLAN: r0=307(x1), r1=190(y1), r2=389(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 190
LDI r2, 389
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
