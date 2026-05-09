; DESCRIPTION: Composite: Sets a single magenta pixel at (244, 204) then Renders a cyan box of size 75x80 starting at (151, 26).
; PLAN: r0=244(x), r1=204(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=151(x), r6=26(y), r7=75(width), r8=80(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 204
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 151
LDI r6, 26
LDI r7, 75
LDI r8, 80
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
