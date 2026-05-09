; DESCRIPTION: Renders a cyan line between points (435, 222) and (298, 172).
; PLAN: r0=435(x1), r1=222(y1), r2=298(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 222
LDI r2, 298
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
