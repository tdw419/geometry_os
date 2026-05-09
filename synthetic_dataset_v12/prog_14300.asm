; DESCRIPTION: Composite: Renders a orange box of size 38x120 starting at (132, 45) then Renders a red disk with center (44, 73) and radius 16.
; PLAN: r0=132(x), r1=45(y), r2=38(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x), r6=73(y), r7=16(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 45
LDI r2, 38
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 73
LDI r7, 16
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
