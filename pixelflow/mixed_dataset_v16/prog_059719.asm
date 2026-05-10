; DESCRIPTION: Draws a cyan line from (243, 254) to (439, 231).
; PLAN: r0=243(x1), r1=254(y1), r2=439(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 254
LDI r2, 439
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
