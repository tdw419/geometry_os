; DESCRIPTION: Composite: Places a yellow dot at position (264, 66) then Creates a purple rectangular region at (284, 150) spanning 93 by 32 pixels.
; PLAN: r0=264(x), r1=66(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=150(y), r7=93(width), r8=32(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 66
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 284
LDI r6, 150
LDI r7, 93
LDI r8, 32
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
