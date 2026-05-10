; DESCRIPTION: Composite: Places a yellow dot at position (298, 140) then Renders a blue box of size 56x20 starting at (67, 32).
; PLAN: r0=298(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=32(y), r7=56(width), r8=20(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 140
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 67
LDI r6, 32
LDI r7, 56
LDI r8, 20
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
