; DESCRIPTION: Composite: Places a cyan 71x65 rectangle at position (138, 163) then Renders a magenta disk with center (197, 54) and radius 28.
; PLAN: r0=138(x), r1=163(y), r2=71(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=54(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 163
LDI r2, 71
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 54
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
