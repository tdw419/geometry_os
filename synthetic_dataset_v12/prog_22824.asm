; DESCRIPTION: Composite: Places a green dot at position (202, 59) then Draws a white circle centered at (412, 42) with radius 22.
; PLAN: r0=202(x), r1=59(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=42(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 202
LDI r1, 59
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 412
LDI r6, 42
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
