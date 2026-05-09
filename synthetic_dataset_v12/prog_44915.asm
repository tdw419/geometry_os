; DESCRIPTION: Draws a cyan line from (374, 157) to (256, 24).
; PLAN: r0=374(x1), r1=157(y1), r2=256(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 157
LDI r2, 256
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
