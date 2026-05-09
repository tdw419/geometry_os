; DESCRIPTION: Renders a black line between points (405, 220) and (439, 231).
; PLAN: r0=405(x1), r1=220(y1), r2=439(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 220
LDI r2, 439
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
