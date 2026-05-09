; DESCRIPTION: Composite: Sets a single white pixel at (61, 220) then Renders a black box of size 33x103 starting at (294, 153).
; PLAN: r0=61(x), r1=220(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=294(x), r6=153(y), r7=33(width), r8=103(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 220
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 294
LDI r6, 153
LDI r7, 33
LDI r8, 103
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
