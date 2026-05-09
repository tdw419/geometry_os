; DESCRIPTION: Draws a cyan line from (271, 52) to (324, 92).
; PLAN: r0=271(x1), r1=52(y1), r2=324(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 52
LDI r2, 324
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
