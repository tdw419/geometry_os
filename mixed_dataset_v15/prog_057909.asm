; DESCRIPTION: Composite: Places a white dot at position (373, 129) then Places a green circle of radius 70 at center (401, 172).
; PLAN: r0=373(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=172(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 373
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 401
LDI r6, 172
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
