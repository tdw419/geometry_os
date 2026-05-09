; DESCRIPTION: Composite: Renders a cyan box of size 79x12 starting at (306, 166) then Draws a yellow circle centered at (208, 125) with radius 70.
; PLAN: r0=306(x), r1=166(y), r2=79(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=125(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 306
LDI r1, 166
LDI r2, 79
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 125
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
