; DESCRIPTION: Draws a cyan line from (335, 252) to (242, 150).
; PLAN: r0=335(x1), r1=252(y1), r2=242(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 252
LDI r2, 242
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
