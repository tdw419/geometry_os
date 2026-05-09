; DESCRIPTION: Draws a cyan line from (498, 127) to (224, 232).
; PLAN: r0=498(x1), r1=127(y1), r2=224(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 127
LDI r2, 224
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
