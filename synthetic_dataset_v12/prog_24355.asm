; DESCRIPTION: Composite: Places a blue dot at position (91, 132) then Renders a cyan box of size 91x41 starting at (52, 212) then Places a green line segment connecting (101, 2) to (421, 208).
; PLAN: r0=91(x), r1=132(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=52(x), r6=212(y), r7=91(width), r8=41(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=101(x1), r11=2(y1), r12=421(x2), r13=208(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 132
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 212
LDI r7, 91
LDI r8, 41
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 2
LDI r12, 421
LDI r13, 208
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
