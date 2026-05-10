; DESCRIPTION: Draws a cyan line from (440, 245) to (26, 192).
; PLAN: r0=440(x1), r1=245(y1), r2=26(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 245
LDI r2, 26
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
