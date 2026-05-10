; DESCRIPTION: Composite: Renders a red disk with center (170, 141) and radius 80 then Places a yellow 42x86 rectangle at position (2, 92).
; PLAN: r0=170(x), r1=141(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=92(y), r7=42(width), r8=86(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 141
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 92
LDI r7, 42
LDI r8, 86
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
