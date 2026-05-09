; DESCRIPTION: Composite: . Then Places a green dot at position (127, 46). Then Places a yellow circle of radius 46 at center (209, 99).
; PLAN: r0=127(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=209(x), r1=99(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (127, 46).
; PLAN: r0=127(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 46
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 46 at center (209, 99).
; PLAN: r0=209(x), r1=99(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 99
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
