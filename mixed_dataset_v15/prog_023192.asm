; DESCRIPTION: Composite: Places a green dot at position (216, 13) then Creates a orange rectangular region at (125, 34) spanning 42 by 78 pixels.
; PLAN: r0=216(x), r1=13(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=34(y), r7=42(width), r8=78(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 13
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 125
LDI r6, 34
LDI r7, 42
LDI r8, 78
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
