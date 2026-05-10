; DESCRIPTION: Composite: Renders a magenta box of size 22x92 starting at (362, 125) then Sets a single blue pixel at (370, 13).
; PLAN: r0=362(x), r1=125(y), r2=22(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=13(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 125
LDI r2, 22
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 13
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
