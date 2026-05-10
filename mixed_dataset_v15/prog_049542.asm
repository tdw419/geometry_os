; DESCRIPTION: Renders a green line between points (391, 239) and (413, 41).
; PLAN: r0=391(x1), r1=239(y1), r2=413(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 239
LDI r2, 413
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
