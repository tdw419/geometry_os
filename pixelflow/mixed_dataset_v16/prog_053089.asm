; DESCRIPTION: Composite: Places a cyan line segment connecting (458, 109) to (214, 197) then Places a white dot at position (402, 207).
; PLAN: r0=458(x1), r1=109(y1), r2=214(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=207(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 458
LDI r1, 109
LDI r2, 214
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 207
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
