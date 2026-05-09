; DESCRIPTION: Draws a cyan line from (460, 45) to (323, 221).
; PLAN: r0=460(x1), r1=45(y1), r2=323(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 45
LDI r2, 323
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
