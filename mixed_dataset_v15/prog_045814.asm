; DESCRIPTION: Composite: Renders a orange box of size 58x64 starting at (56, 86) then Places a magenta dot at position (49, 200).
; PLAN: r0=56(x), r1=86(y), r2=58(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=200(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 56
LDI r1, 86
LDI r2, 58
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 200
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
