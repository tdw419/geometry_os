; DESCRIPTION: Renders a black line between points (144, 215) and (275, 27).
; PLAN: r0=144(x1), r1=215(y1), r2=275(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 215
LDI r2, 275
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
