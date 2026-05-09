; DESCRIPTION: Renders a red line between points (261, 32) and (298, 213).
; PLAN: r0=261(x1), r1=32(y1), r2=298(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 32
LDI r2, 298
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
