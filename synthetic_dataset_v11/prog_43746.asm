; DESCRIPTION: Composite: . Then Draws a cyan line from (99, 71) to (4, 196). Then Places a blue dot at position (86, 209).
; PLAN: r0=99(x1), r1=71(y1), r2=4(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=86(x), r1=209(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (99, 71) to (4, 196).
; PLAN: r0=99(x1), r1=71(y1), r2=4(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 71
LDI r2, 4
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (86, 209).
; PLAN: r0=86(x), r1=209(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 209
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
