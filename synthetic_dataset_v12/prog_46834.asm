; DESCRIPTION: Composite: Places a green dot at position (305, 55) then Renders a yellow disk with center (228, 98) and radius 79.
; PLAN: r0=305(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=98(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 55
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 228
LDI r6, 98
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
