; DESCRIPTION: Composite: Places a magenta dot at position (239, 206) then Places a white circle of radius 65 at center (269, 146).
; PLAN: r0=239(x), r1=206(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=146(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 239
LDI r1, 206
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 146
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
