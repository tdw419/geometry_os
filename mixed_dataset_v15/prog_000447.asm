; DESCRIPTION: Draws a white line from (27, 239) to (18, 110).
; PLAN: r0=27(x1), r1=239(y1), r2=18(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 239
LDI r2, 18
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
