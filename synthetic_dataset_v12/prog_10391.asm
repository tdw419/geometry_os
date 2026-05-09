; DESCRIPTION: Draws a cyan line from (433, 23) to (460, 145).
; PLAN: r0=433(x1), r1=23(y1), r2=460(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 23
LDI r2, 460
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
