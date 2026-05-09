; DESCRIPTION: Composite: Places a red 54x111 rectangle at position (394, 23) then Places a green circle of radius 48 at center (221, 78).
; PLAN: r0=394(x), r1=23(y), r2=54(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=78(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 23
LDI r2, 54
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 78
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
