; DESCRIPTION: Composite: Places a green dot at position (95, 223) then Renders a blue box of size 88x67 starting at (331, 137).
; PLAN: r0=95(x), r1=223(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=331(x), r6=137(y), r7=88(width), r8=67(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 223
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 331
LDI r6, 137
LDI r7, 88
LDI r8, 67
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
