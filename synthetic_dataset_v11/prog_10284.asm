; DESCRIPTION: Composite: . Then Renders a white disk with center (46, 186) and radius 21. Then Sets a single blue pixel at (171, 154).
; PLAN: r0=46(x), r1=186(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=171(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white disk with center (46, 186) and radius 21.
; PLAN: r0=46(x), r1=186(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 186
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single blue pixel at (171, 154).
; PLAN: r0=171(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
