; DESCRIPTION: Draws a cyan line from (115, 218) to (494, 91).
; PLAN: r0=115(x1), r1=218(y1), r2=494(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 218
LDI r2, 494
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
