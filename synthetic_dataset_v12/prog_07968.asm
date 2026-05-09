; DESCRIPTION: Composite: Places a cyan 36x95 rectangle at position (176, 138) then Sets a single green pixel at (422, 192).
; PLAN: r0=176(x), r1=138(y), r2=36(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=192(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 176
LDI r1, 138
LDI r2, 36
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 192
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
