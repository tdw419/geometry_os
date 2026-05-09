; DESCRIPTION: Draws a cyan line from (325, 197) to (270, 50).
; PLAN: r0=325(x1), r1=197(y1), r2=270(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 197
LDI r2, 270
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
