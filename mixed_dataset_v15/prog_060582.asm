; DESCRIPTION: Composite: Places a black dot at position (125, 113) then Places a blue circle of radius 28 at center (320, 215).
; PLAN: r0=125(x), r1=113(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=215(y), r7=28(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 113
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 320
LDI r6, 215
LDI r7, 28
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
