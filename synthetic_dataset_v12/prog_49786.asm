; DESCRIPTION: Draws a cyan line from (460, 58) to (475, 176).
; PLAN: r0=460(x1), r1=58(y1), r2=475(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 58
LDI r2, 475
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
