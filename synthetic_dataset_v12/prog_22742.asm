; DESCRIPTION: Renders a purple line between points (284, 236) and (295, 43).
; PLAN: r0=284(x1), r1=236(y1), r2=295(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 236
LDI r2, 295
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
