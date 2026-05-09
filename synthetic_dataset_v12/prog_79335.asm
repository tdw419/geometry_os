; DESCRIPTION: Renders a cyan line between points (190, 8) and (284, 88).
; PLAN: r0=190(x1), r1=8(y1), r2=284(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 8
LDI r2, 284
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
