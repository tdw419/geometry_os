; DESCRIPTION: Composite: Creates a red circular shape at (303, 88) with radius 66 then Places a cyan 111x57 rectangle at position (132, 48).
; PLAN: r0=303(x), r1=88(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=48(y), r7=111(width), r8=57(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 88
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 48
LDI r7, 111
LDI r8, 57
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
