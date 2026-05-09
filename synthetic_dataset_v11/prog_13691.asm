; DESCRIPTION: Composite: . Then Places a white dot at position (52, 231). Then Renders a blue line between points (28, 195) and (100, 254).
; PLAN: r0=52(x), r1=231(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=28(x1), r1=195(y1), r2=100(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (52, 231).
; PLAN: r0=52(x), r1=231(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 231
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (28, 195) and (100, 254).
; PLAN: r0=28(x1), r1=195(y1), r2=100(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 195
LDI r2, 100
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
