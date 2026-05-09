; DESCRIPTION: Draws a cyan line from (242, 156) to (420, 63).
; PLAN: r0=242(x1), r1=156(y1), r2=420(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 156
LDI r2, 420
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
