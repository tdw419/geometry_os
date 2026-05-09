; DESCRIPTION: Draws a cyan line from (176, 4) to (193, 30).
; PLAN: r0=176(x1), r1=4(y1), r2=193(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 4
LDI r2, 193
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
