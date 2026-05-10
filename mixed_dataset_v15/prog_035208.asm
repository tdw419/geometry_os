; DESCRIPTION: Draws a cyan line from (112, 129) to (253, 28).
; PLAN: r0=112(x1), r1=129(y1), r2=253(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 129
LDI r2, 253
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
