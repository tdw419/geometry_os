; DESCRIPTION: Composite: Places a green dot at position (403, 229) then Places a white circle of radius 19 at center (165, 174).
; PLAN: r0=403(x), r1=229(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=174(y), r7=19(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 229
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 165
LDI r6, 174
LDI r7, 19
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
