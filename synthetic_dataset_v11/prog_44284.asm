; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (250, 125). Then Renders a yellow line between points (243, 153) and (127, 23).
; PLAN: r0=250(x), r1=125(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=243(x1), r1=153(y1), r2=127(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (250, 125).
; PLAN: r0=250(x), r1=125(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 125
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (243, 153) and (127, 23).
; PLAN: r0=243(x1), r1=153(y1), r2=127(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 153
LDI r2, 127
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
