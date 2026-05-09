; DESCRIPTION: Composite: Places a blue dot at position (39, 63) then Places a magenta 57x39 rectangle at position (361, 114) then Renders a cyan disk with center (244, 152) and radius 61.
; PLAN: r0=39(x), r1=63(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=361(x), r6=114(y), r7=57(width), r8=39(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=244(x), r11=152(y), r12=61(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 39
LDI r1, 63
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 361
LDI r6, 114
LDI r7, 57
LDI r8, 39
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 152
LDI r12, 61
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
