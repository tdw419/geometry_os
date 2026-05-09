; DESCRIPTION: Composite: . Then Renders a orange disk with center (162, 198) and radius 23. Then Places a magenta dot at position (152, 42).
; PLAN: r0=162(x), r1=198(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=152(x), r1=42(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (162, 198) and radius 23.
; PLAN: r0=162(x), r1=198(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 198
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (152, 42).
; PLAN: r0=152(x), r1=42(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 42
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
