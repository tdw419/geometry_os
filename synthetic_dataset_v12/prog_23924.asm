; DESCRIPTION: Renders a green line between points (284, 80) and (278, 56).
; PLAN: r0=284(x1), r1=80(y1), r2=278(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 80
LDI r2, 278
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
