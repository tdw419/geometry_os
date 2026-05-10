; DESCRIPTION: Draws a cyan line from (359, 180) to (365, 244).
; PLAN: r0=359(x1), r1=180(y1), r2=365(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 180
LDI r2, 365
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
