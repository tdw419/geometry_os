; DESCRIPTION: Composite: Places a green dot at position (260, 164) then Renders a black box of size 14x70 starting at (260, 179).
; PLAN: r0=260(x), r1=164(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=179(y), r7=14(width), r8=70(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 164
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 260
LDI r6, 179
LDI r7, 14
LDI r8, 70
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
