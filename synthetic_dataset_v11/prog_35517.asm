; DESCRIPTION: Draws a cyan line from (180, 26) to (255, 34).
; PLAN: r0=180(x1), r1=26(y1), r2=255(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 26
LDI r2, 255
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
