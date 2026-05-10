; DESCRIPTION: Composite: Creates a white circular shape at (277, 138) with radius 21 then Places a red dot at position (479, 59).
; PLAN: r0=277(x), r1=138(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x), r6=59(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 138
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 59
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
