; DESCRIPTION: Composite: Places a magenta dot at position (504, 132) then Renders a yellow box of size 43x45 starting at (352, 46).
; PLAN: r0=504(x), r1=132(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=46(y), r7=43(width), r8=45(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 504
LDI r1, 132
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 46
LDI r7, 43
LDI r8, 45
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
