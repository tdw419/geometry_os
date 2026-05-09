; DESCRIPTION: Draws a cyan line from (441, 51) to (410, 19).
; PLAN: r0=441(x1), r1=51(y1), r2=410(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 51
LDI r2, 410
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
