; DESCRIPTION: Renders a white line between points (381, 148) and (242, 215).
; PLAN: r0=381(x1), r1=148(y1), r2=242(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 148
LDI r2, 242
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
