; DESCRIPTION: Draws a cyan line from (389, 254) to (255, 176).
; PLAN: r0=389(x1), r1=254(y1), r2=255(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 254
LDI r2, 255
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
