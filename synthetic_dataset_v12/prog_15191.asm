; DESCRIPTION: Composite: Renders a cyan box of size 117x112 starting at (319, 114) then Sets a single green pixel at (175, 242).
; PLAN: r0=319(x), r1=114(y), r2=117(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x), r6=242(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 114
LDI r2, 117
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 242
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
