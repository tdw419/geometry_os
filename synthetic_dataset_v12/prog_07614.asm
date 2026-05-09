; DESCRIPTION: Composite: Renders a blue box of size 70x104 starting at (290, 88) then Places a black dot at position (404, 96).
; PLAN: r0=290(x), r1=88(y), r2=70(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=96(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 290
LDI r1, 88
LDI r2, 70
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 96
LDI r7, 0x000000
PSET r5, r6, r7
HALT
