; DESCRIPTION: Draws a cyan line from (4, 224) to (455, 80).
; PLAN: r0=4(x1), r1=224(y1), r2=455(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 224
LDI r2, 455
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
