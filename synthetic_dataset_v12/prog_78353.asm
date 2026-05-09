; DESCRIPTION: Renders a white line between points (247, 164) and (284, 45).
; PLAN: r0=247(x1), r1=164(y1), r2=284(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 164
LDI r2, 284
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
