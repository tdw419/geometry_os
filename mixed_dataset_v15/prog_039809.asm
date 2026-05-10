; DESCRIPTION: Renders a white line between points (340, 87) and (482, 125).
; PLAN: r0=340(x1), r1=87(y1), r2=482(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 87
LDI r2, 482
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
