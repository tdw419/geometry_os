; DESCRIPTION: Renders a cyan line between points (298, 124) and (480, 252).
; PLAN: r0=298(x1), r1=124(y1), r2=480(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 124
LDI r2, 480
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
