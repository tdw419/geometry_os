; DESCRIPTION: Draws a green line from (298, 209) to (420, 120).
; PLAN: r0=298(x1), r1=209(y1), r2=420(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 209
LDI r2, 420
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
