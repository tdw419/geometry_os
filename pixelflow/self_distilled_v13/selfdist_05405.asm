; DESCRIPTION: Renders a cyan line segment connecting (256, 146) to (188, 41).
; PLAN: r0=256(x1), r1=146(y1), r2=188(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 146
LDI r2, 188
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
