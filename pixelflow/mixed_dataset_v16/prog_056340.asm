; DESCRIPTION: Composite: Places a cyan dot at position (305, 37) then Renders a red disk with center (303, 153) and radius 23.
; PLAN: r0=305(x), r1=37(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=303(x), r6=153(y), r7=23(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 37
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 303
LDI r6, 153
LDI r7, 23
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
