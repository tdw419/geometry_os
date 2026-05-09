; DESCRIPTION: Renders a green line between points (497, 173) and (296, 231).
; PLAN: r0=497(x1), r1=173(y1), r2=296(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 173
LDI r2, 296
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
