; DESCRIPTION: Draws a cyan line from (465, 208) to (453, 40).
; PLAN: r0=465(x1), r1=208(y1), r2=453(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 208
LDI r2, 453
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
