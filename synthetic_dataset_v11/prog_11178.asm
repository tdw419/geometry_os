; DESCRIPTION: Composite: . Then Sets a single orange pixel at (243, 82). Then Renders a white box of size 48x85 starting at (153, 106).
; PLAN: r0=243(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=153(x), r1=106(y), r2=48(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (243, 82).
; PLAN: r0=243(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 48x85 starting at (153, 106).
; PLAN: r0=153(x), r1=106(y), r2=48(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 106
LDI r2, 48
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
