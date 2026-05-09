; DESCRIPTION: Renders a white line between points (294, 98) and (3, 215).
; PLAN: r0=294(x1), r1=98(y1), r2=3(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 98
LDI r2, 3
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
