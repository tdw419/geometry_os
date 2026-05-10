; DESCRIPTION: Renders a black line between points (284, 207) and (209, 157).
; PLAN: r0=284(x1), r1=207(y1), r2=209(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 207
LDI r2, 209
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
