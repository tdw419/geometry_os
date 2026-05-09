; DESCRIPTION: Draws a cyan line from (58, 38) to (224, 159).
; PLAN: r0=58(x1), r1=38(y1), r2=224(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 38
LDI r2, 224
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
