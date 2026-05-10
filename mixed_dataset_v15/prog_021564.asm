; DESCRIPTION: Composite: Renders a orange box of size 87x73 starting at (296, 166) then Renders a cyan disk with center (387, 63) and radius 34.
; PLAN: r0=296(x), r1=166(y), r2=87(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=63(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 166
LDI r2, 87
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 63
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
