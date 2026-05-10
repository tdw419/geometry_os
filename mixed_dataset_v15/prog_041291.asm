; DESCRIPTION: Composite: Places a magenta dot at position (428, 161) then Renders a blue box of size 63x28 starting at (80, 75).
; PLAN: r0=428(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=75(y), r7=63(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 80
LDI r6, 75
LDI r7, 63
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
