; DESCRIPTION: Composite: Places a magenta dot at position (323, 27) then Renders a yellow box of size 39x34 starting at (448, 31).
; PLAN: r0=323(x), r1=27(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=448(x), r6=31(y), r7=39(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 27
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 448
LDI r6, 31
LDI r7, 39
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
