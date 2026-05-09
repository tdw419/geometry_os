; DESCRIPTION: Composite: Sets a single blue pixel at (138, 231) then Places a black 40x38 rectangle at position (413, 117).
; PLAN: r0=138(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=117(y), r7=40(width), r8=38(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 231
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 117
LDI r7, 40
LDI r8, 38
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
