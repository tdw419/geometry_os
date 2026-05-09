; DESCRIPTION: Composite: Places a yellow dot at position (408, 237) then Renders a blue box of size 80x115 starting at (327, 22).
; PLAN: r0=408(x), r1=237(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=22(y), r7=80(width), r8=115(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 237
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 327
LDI r6, 22
LDI r7, 80
LDI r8, 115
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
