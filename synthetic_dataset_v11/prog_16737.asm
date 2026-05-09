; DESCRIPTION: Draws a cyan line from (242, 226) to (222, 26).
; PLAN: r0=242(x1), r1=226(y1), r2=222(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 226
LDI r2, 222
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
