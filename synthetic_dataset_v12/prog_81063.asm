; DESCRIPTION: Composite: Renders a white box of size 33x25 starting at (273, 207) then Sets a single purple pixel at (202, 192).
; PLAN: r0=273(x), r1=207(y), r2=33(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x), r6=192(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 207
LDI r2, 33
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 192
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
