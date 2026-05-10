; DESCRIPTION: Composite: Places a magenta dot at position (225, 236) then Renders a magenta box of size 91x18 starting at (236, 138).
; PLAN: r0=225(x), r1=236(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=138(y), r7=91(width), r8=18(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 225
LDI r1, 236
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 138
LDI r7, 91
LDI r8, 18
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
