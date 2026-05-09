; DESCRIPTION: Draws a cyan line from (296, 33) to (226, 173).
; PLAN: r0=296(x1), r1=33(y1), r2=226(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 33
LDI r2, 226
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
