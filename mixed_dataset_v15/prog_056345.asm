; DESCRIPTION: Composite: Places a red 20x40 rectangle at position (273, 125) then Places a magenta dot at position (460, 17).
; PLAN: r0=273(x), r1=125(y), r2=20(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x), r6=17(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 125
LDI r2, 20
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 17
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
