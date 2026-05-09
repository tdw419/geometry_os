; DESCRIPTION: Renders a blue line between points (329, 65) and (284, 37).
; PLAN: r0=329(x1), r1=65(y1), r2=284(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 65
LDI r2, 284
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
