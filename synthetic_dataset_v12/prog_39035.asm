; DESCRIPTION: Draws a cyan line from (440, 143) to (302, 214).
; PLAN: r0=440(x1), r1=143(y1), r2=302(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 143
LDI r2, 302
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
