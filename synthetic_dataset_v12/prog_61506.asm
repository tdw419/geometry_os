; DESCRIPTION: Draws a green line from (228, 86) to (24, 65).
; PLAN: r0=228(x1), r1=86(y1), r2=24(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 86
LDI r2, 24
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
