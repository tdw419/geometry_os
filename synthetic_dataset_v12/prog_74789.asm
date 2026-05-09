; DESCRIPTION: Composite: Creates a white circular shape at (218, 126) with radius 37 then Places a cyan dot at position (294, 124) then Renders a green line between points (251, 113) and (278, 46).
; PLAN: r0=218(x), r1=126(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=124(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=251(x1), r11=113(y1), r12=278(x2), r13=46(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 126
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 124
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 251
LDI r11, 113
LDI r12, 278
LDI r13, 46
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
