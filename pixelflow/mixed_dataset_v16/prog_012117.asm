; DESCRIPTION: Composite: Places a red dot at position (443, 4) then Creates a magenta circular shape at (244, 226) with radius 19 then Places a yellow 42x120 rectangle at position (5, 47).
; PLAN: r0=443(x), r1=4(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=226(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=5(x), r11=47(y), r12=42(width), r13=120(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 4
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 244
LDI r6, 226
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 5
LDI r11, 47
LDI r12, 42
LDI r13, 120
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
