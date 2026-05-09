; DESCRIPTION: Composite: Renders a magenta box of size 115x50 starting at (187, 166) then Places a orange dot at position (3, 132).
; PLAN: r0=187(x), r1=166(y), r2=115(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x), r6=132(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 187
LDI r1, 166
LDI r2, 115
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 132
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
