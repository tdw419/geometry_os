; DESCRIPTION: Composite: . Then Places a red dot at position (135, 231). Then Renders a yellow disk with center (69, 226) and radius 26.
; PLAN: r0=135(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=69(x), r1=226(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (135, 231).
; PLAN: r0=135(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow disk with center (69, 226) and radius 26.
; PLAN: r0=69(x), r1=226(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 226
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
