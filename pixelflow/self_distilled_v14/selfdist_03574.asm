; DESCRIPTION: Renders a cyan line segment connecting (298, 141) to (386, 125).
; PLAN: r0=298(x1), r1=141(y1), r2=386(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 141
LDI r2, 386
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
