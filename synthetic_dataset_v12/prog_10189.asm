; DESCRIPTION: Draws a cyan line from (283, 242) to (104, 43).
; PLAN: r0=283(x1), r1=242(y1), r2=104(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 242
LDI r2, 104
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
