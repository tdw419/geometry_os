; DESCRIPTION: Composite: Places a black dot at position (99, 176) then Renders a blue box of size 120x40 starting at (368, 216).
; PLAN: r0=99(x), r1=176(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=216(y), r7=120(width), r8=40(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 176
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 368
LDI r6, 216
LDI r7, 120
LDI r8, 40
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
