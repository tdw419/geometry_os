; DESCRIPTION: Draws a cyan line from (307, 245) to (40, 204).
; PLAN: r0=307(x1), r1=245(y1), r2=40(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 245
LDI r2, 40
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
