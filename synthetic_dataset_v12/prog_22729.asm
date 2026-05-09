; DESCRIPTION: Draws a cyan line from (475, 174) to (460, 64).
; PLAN: r0=475(x1), r1=174(y1), r2=460(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 174
LDI r2, 460
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
