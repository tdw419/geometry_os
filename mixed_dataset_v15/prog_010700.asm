; DESCRIPTION: Composite: Places a magenta dot at position (312, 52) then Places a orange 87x111 rectangle at position (123, 98).
; PLAN: r0=312(x), r1=52(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=123(x), r6=98(y), r7=87(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 52
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 123
LDI r6, 98
LDI r7, 87
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
