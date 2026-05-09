; DESCRIPTION: Composite: Places a white dot at position (386, 79) then Places a yellow 91x33 rectangle at position (254, 182).
; PLAN: r0=386(x), r1=79(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=182(y), r7=91(width), r8=33(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 79
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 254
LDI r6, 182
LDI r7, 91
LDI r8, 33
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
