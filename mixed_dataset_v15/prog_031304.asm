; DESCRIPTION: Composite: Sets a single cyan pixel at (409, 89) then Renders a red box of size 67x63 starting at (319, 1).
; PLAN: r0=409(x), r1=89(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=1(y), r7=67(width), r8=63(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 89
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 1
LDI r7, 67
LDI r8, 63
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
