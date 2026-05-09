; DESCRIPTION: Draws a cyan line from (92, 230) to (190, 127).
; PLAN: r0=92(x1), r1=230(y1), r2=190(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 230
LDI r2, 190
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
