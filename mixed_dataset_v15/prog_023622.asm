; DESCRIPTION: Renders a yellow line between points (284, 57) and (440, 18).
; PLAN: r0=284(x1), r1=57(y1), r2=440(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 57
LDI r2, 440
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
