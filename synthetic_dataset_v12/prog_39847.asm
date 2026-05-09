; DESCRIPTION: Renders a green line between points (284, 52) and (484, 16).
; PLAN: r0=284(x1), r1=52(y1), r2=484(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 52
LDI r2, 484
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
