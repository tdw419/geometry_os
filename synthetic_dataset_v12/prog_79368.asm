; DESCRIPTION: Composite: Places a black dot at position (327, 154) then Renders a blue box of size 46x91 starting at (10, 154).
; PLAN: r0=327(x), r1=154(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=154(y), r7=46(width), r8=91(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 154
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 10
LDI r6, 154
LDI r7, 46
LDI r8, 91
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
