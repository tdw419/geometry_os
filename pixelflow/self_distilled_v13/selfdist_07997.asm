; DESCRIPTION: Renders a cyan line segment connecting (176, 24) to (72, 103).
; PLAN: r0=176(x1), r1=24(y1), r2=72(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 24
LDI r2, 72
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
