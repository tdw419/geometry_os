; DESCRIPTION: Composite: Draws a yellow rectangle at (365, 54) with width 51 and height 63 then Renders a cyan disk with center (434, 150) and radius 77.
; PLAN: r0=365(x), r1=54(y), r2=51(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=150(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 365
LDI r1, 54
LDI r2, 51
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 150
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
