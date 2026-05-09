; DESCRIPTION: Composite: Places a purple dot at position (22, 63) then Places a yellow 12x63 rectangle at position (176, 187).
; PLAN: r0=22(x), r1=63(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=187(y), r7=12(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 22
LDI r1, 63
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 176
LDI r6, 187
LDI r7, 12
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
