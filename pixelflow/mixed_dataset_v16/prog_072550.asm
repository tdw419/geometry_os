; DESCRIPTION: Draws a green line from (228, 91) to (167, 72).
; PLAN: r0=228(x1), r1=91(y1), r2=167(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 91
LDI r2, 167
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
