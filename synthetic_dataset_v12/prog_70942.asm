; DESCRIPTION: Renders a green line between points (30, 239) and (143, 192).
; PLAN: r0=30(x1), r1=239(y1), r2=143(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 239
LDI r2, 143
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
