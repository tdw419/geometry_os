; DESCRIPTION: Composite: Creates a blue circular shape at (386, 153) with radius 50 then Places a yellow 86x54 rectangle at position (346, 174) then Places a red dot at position (362, 223).
; PLAN: r0=386(x), r1=153(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=174(y), r7=86(width), r8=54(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=362(x), r11=223(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 386
LDI r1, 153
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 174
LDI r7, 86
LDI r8, 54
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 223
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
