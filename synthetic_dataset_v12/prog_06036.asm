; DESCRIPTION: Composite: Sets a single cyan pixel at (21, 221) then Places a green circle of radius 27 at center (460, 144).
; PLAN: r0=21(x), r1=221(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=460(x), r6=144(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 221
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 460
LDI r6, 144
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
