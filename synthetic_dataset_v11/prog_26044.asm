; DESCRIPTION: Composite: . Then Renders a orange disk with center (70, 154) and radius 63. Then Sets a single magenta pixel at (184, 193).
; PLAN: r0=70(x), r1=154(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=184(x), r1=193(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (70, 154) and radius 63.
; PLAN: r0=70(x), r1=154(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 154
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (184, 193).
; PLAN: r0=184(x), r1=193(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 193
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
