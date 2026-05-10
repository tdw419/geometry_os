; DESCRIPTION: Composite: Places a orange dot at position (168, 187) then Creates a blue rectangular region at (294, 204) spanning 88 by 33 pixels.
; PLAN: r0=168(x), r1=187(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=294(x), r6=204(y), r7=88(width), r8=33(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 187
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 294
LDI r6, 204
LDI r7, 88
LDI r8, 33
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
