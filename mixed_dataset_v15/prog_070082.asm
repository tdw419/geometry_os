; DESCRIPTION: Composite: Creates a blue circular shape at (353, 87) with radius 46 then Renders a orange box of size 79x86 starting at (46, 73).
; PLAN: r0=353(x), r1=87(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=73(y), r7=79(width), r8=86(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 87
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 73
LDI r7, 79
LDI r8, 86
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
