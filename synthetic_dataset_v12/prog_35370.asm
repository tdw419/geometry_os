; DESCRIPTION: Composite: Renders a white box of size 75x86 starting at (125, 74) then Sets a single green pixel at (204, 60).
; PLAN: r0=125(x), r1=74(y), r2=75(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=60(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 125
LDI r1, 74
LDI r2, 75
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 60
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
