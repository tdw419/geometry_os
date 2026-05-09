; DESCRIPTION: Composite: Sets a single orange pixel at (507, 230) then Places a white 46x80 rectangle at position (379, 33).
; PLAN: r0=507(x), r1=230(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=33(y), r7=46(width), r8=80(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 507
LDI r1, 230
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 379
LDI r6, 33
LDI r7, 46
LDI r8, 80
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
