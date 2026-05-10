; DESCRIPTION: Composite: Sets a single magenta pixel at (209, 16) then Renders a white disk with center (429, 187) and radius 63 then Renders a orange box of size 30x63 starting at (107, 103).
; PLAN: r0=209(x), r1=16(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=187(y), r7=63(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=107(x), r11=103(y), r12=30(width), r13=63(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 16
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 429
LDI r6, 187
LDI r7, 63
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 107
LDI r11, 103
LDI r12, 30
LDI r13, 63
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
