; DESCRIPTION: Draws a cyan line from (123, 12) to (296, 207).
; PLAN: r0=123(x1), r1=12(y1), r2=296(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 12
LDI r2, 296
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
