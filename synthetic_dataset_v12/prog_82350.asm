; DESCRIPTION: Draws a cyan line from (176, 175) to (315, 242).
; PLAN: r0=176(x1), r1=175(y1), r2=315(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 175
LDI r2, 315
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
