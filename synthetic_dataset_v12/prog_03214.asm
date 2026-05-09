; DESCRIPTION: Composite: Sets a single white pixel at (77, 231) then Places a cyan 59x52 rectangle at position (312, 167).
; PLAN: r0=77(x), r1=231(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=167(y), r7=59(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 231
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 167
LDI r7, 59
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
