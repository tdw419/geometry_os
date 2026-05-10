; DESCRIPTION: Composite: Renders a green box of size 66x75 starting at (362, 2) then Places a green dot at position (367, 2).
; PLAN: r0=362(x), r1=2(y), r2=66(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=2(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 2
LDI r2, 66
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 2
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
