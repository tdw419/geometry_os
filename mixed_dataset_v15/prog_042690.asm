; DESCRIPTION: Composite: Renders a cyan box of size 72x81 starting at (350, 1) then Places a orange circle of radius 28 at center (357, 204).
; PLAN: r0=350(x), r1=1(y), r2=72(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=204(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 350
LDI r1, 1
LDI r2, 72
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 204
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
