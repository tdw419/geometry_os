; DESCRIPTION: Draws a cyan line from (32, 94) to (283, 51).
; PLAN: r0=32(x1), r1=94(y1), r2=283(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 94
LDI r2, 283
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
