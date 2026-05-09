; DESCRIPTION: Composite: Sets a single blue pixel at (220, 230) then Renders a yellow box of size 53x59 starting at (456, 106).
; PLAN: r0=220(x), r1=230(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=456(x), r6=106(y), r7=53(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 230
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 456
LDI r6, 106
LDI r7, 53
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
