; DESCRIPTION: Composite: . Then Renders a white box of size 65x70 starting at (111, 44). Then Sets a single cyan pixel at (32, 214).
; PLAN: r0=111(x), r1=44(y), r2=65(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=32(x), r1=214(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 65x70 starting at (111, 44).
; PLAN: r0=111(x), r1=44(y), r2=65(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 44
LDI r2, 65
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (32, 214).
; PLAN: r0=32(x), r1=214(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 214
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
