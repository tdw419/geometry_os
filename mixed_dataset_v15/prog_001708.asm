; DESCRIPTION: Composite: Places a purple dot at position (160, 245) then Renders a magenta box of size 113x58 starting at (294, 148).
; PLAN: r0=160(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=294(x), r6=148(y), r7=113(width), r8=58(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 245
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 294
LDI r6, 148
LDI r7, 113
LDI r8, 58
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
