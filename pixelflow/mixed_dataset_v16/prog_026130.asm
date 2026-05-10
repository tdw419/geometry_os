; DESCRIPTION: Composite: Places a purple dot at position (123, 63) then Creates a yellow rectangular region at (127, 103) spanning 70 by 18 pixels.
; PLAN: r0=123(x), r1=63(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=103(y), r7=70(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 63
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 103
LDI r7, 70
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
