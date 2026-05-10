; DESCRIPTION: Draws a cyan line from (130, 45) to (128, 163).
; PLAN: r0=130(x1), r1=45(y1), r2=128(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 45
LDI r2, 128
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
