; DESCRIPTION: Composite: Renders a magenta disk with center (164, 81) and radius 56 then Places a white 41x64 rectangle at position (333, 152).
; PLAN: r0=164(x), r1=81(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x), r6=152(y), r7=41(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 81
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 152
LDI r7, 41
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
