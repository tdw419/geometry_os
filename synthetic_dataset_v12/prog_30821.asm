; DESCRIPTION: Composite: Renders a cyan disk with center (27, 202) and radius 18 then Places a cyan dot at position (130, 154).
; PLAN: r0=27(x), r1=202(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x), r6=154(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 27
LDI r1, 202
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 154
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
