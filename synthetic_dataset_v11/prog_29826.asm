; DESCRIPTION: Composite: . Then Renders a white box of size 65x115 starting at (65, 84). Then Sets a single orange pixel at (60, 0).
; PLAN: r0=65(x), r1=84(y), r2=65(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=60(x), r1=0(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 65x115 starting at (65, 84).
; PLAN: r0=65(x), r1=84(y), r2=65(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 84
LDI r2, 65
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (60, 0).
; PLAN: r0=60(x), r1=0(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 0
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
