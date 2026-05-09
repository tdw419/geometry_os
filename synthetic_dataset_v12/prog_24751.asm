; DESCRIPTION: Composite: Places a red dot at position (341, 160) then Renders a yellow box of size 27x64 starting at (464, 69).
; PLAN: r0=341(x), r1=160(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=464(x), r6=69(y), r7=27(width), r8=64(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 160
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 464
LDI r6, 69
LDI r7, 27
LDI r8, 64
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
