; DESCRIPTION: Draws a cyan line from (128, 4) to (23, 199).
; PLAN: r0=128(x1), r1=4(y1), r2=23(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 4
LDI r2, 23
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
