; DESCRIPTION: Composite: Renders a yellow disk with center (60, 150) and radius 59 then Renders a cyan box of size 57x75 starting at (44, 64).
; PLAN: r0=60(x), r1=150(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=64(y), r7=57(width), r8=75(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 150
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 64
LDI r7, 57
LDI r8, 75
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
