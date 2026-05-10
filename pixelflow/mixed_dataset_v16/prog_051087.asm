; DESCRIPTION: Composite: Places a magenta dot at position (218, 249) then Creates a orange circular shape at (445, 160) with radius 59.
; PLAN: r0=218(x), r1=249(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=445(x), r6=160(y), r7=59(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 218
LDI r1, 249
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 445
LDI r6, 160
LDI r7, 59
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
