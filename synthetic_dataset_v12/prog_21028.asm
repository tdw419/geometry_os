; DESCRIPTION: Composite: Places a cyan dot at position (346, 163) then Places a white line segment connecting (185, 193) to (283, 124).
; PLAN: r0=346(x), r1=163(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=185(x1), r6=193(y1), r7=283(x2), r8=124(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 163
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 185
LDI r6, 193
LDI r7, 283
LDI r8, 124
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
