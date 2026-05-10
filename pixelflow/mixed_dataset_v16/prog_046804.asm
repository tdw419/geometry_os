; DESCRIPTION: Renders a cyan line between points (132, 201) and (401, 125).
; PLAN: r0=132(x1), r1=201(y1), r2=401(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 201
LDI r2, 401
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
