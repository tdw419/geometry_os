; DESCRIPTION: Draws a cyan line from (112, 23) to (275, 70).
; PLAN: r0=112(x1), r1=23(y1), r2=275(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 23
LDI r2, 275
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
