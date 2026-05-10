; DESCRIPTION: Composite: Places a green dot at position (110, 97) then Renders a red disk with center (300, 150) and radius 28.
; PLAN: r0=110(x), r1=97(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=150(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 97
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 300
LDI r6, 150
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
