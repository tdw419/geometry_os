; DESCRIPTION: Draws a cyan line from (180, 1) to (396, 255).
; PLAN: r0=180(x1), r1=1(y1), r2=396(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 1
LDI r2, 396
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
