; DESCRIPTION: Composite: Places a cyan circle of radius 77 at center (176, 176) then Renders a green box of size 25x57 starting at (56, 163).
; PLAN: r0=176(x), r1=176(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=163(y), r7=25(width), r8=57(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 176
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 163
LDI r7, 25
LDI r8, 57
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
