; DESCRIPTION: Draws a cyan line from (249, 130) to (208, 240).
; PLAN: r0=249(x1), r1=130(y1), r2=208(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 130
LDI r2, 208
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
