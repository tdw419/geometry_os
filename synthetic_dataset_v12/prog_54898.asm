; DESCRIPTION: Draws a cyan line from (439, 200) to (45, 255).
; PLAN: r0=439(x1), r1=200(y1), r2=45(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 200
LDI r2, 45
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
