; DESCRIPTION: Composite: Renders a cyan box of size 95x27 starting at (151, 213) then Draws a red circle centered at (358, 140) with radius 53.
; PLAN: r0=151(x), r1=213(y), r2=95(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=140(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 151
LDI r1, 213
LDI r2, 95
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 140
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
