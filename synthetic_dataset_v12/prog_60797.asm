; DESCRIPTION: Composite: Places a magenta dot at position (482, 214) then Renders a yellow box of size 47x114 starting at (234, 86).
; PLAN: r0=482(x), r1=214(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=234(x), r6=86(y), r7=47(width), r8=114(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 482
LDI r1, 214
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 234
LDI r6, 86
LDI r7, 47
LDI r8, 114
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
