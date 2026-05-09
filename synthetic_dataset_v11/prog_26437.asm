; DESCRIPTION: Composite: . Then Renders a white box of size 70x48 starting at (184, 20). Then Sets a single yellow pixel at (223, 123).
; PLAN: r0=184(x), r1=20(y), r2=70(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=223(x), r1=123(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 70x48 starting at (184, 20).
; PLAN: r0=184(x), r1=20(y), r2=70(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 20
LDI r2, 70
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (223, 123).
; PLAN: r0=223(x), r1=123(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 123
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
