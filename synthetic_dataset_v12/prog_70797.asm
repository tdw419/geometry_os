; DESCRIPTION: Draws a cyan line from (439, 45) to (330, 43).
; PLAN: r0=439(x1), r1=45(y1), r2=330(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 45
LDI r2, 330
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
