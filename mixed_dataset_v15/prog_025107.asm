; DESCRIPTION: Composite: Places a black line segment connecting (337, 144) to (2, 93) then Places a green dot at position (401, 180).
; PLAN: r0=337(x1), r1=144(y1), r2=2(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=180(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 337
LDI r1, 144
LDI r2, 2
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 180
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
