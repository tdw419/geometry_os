; DESCRIPTION: Composite: Renders a magenta box of size 57x81 starting at (368, 1) then Places a cyan dot at position (78, 178).
; PLAN: r0=368(x), r1=1(y), r2=57(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=178(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 368
LDI r1, 1
LDI r2, 57
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 178
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
