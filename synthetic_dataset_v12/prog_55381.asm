; DESCRIPTION: Composite: Places a yellow 41x19 rectangle at position (356, 164) then Creates a orange circular shape at (354, 52) with radius 47.
; PLAN: r0=356(x), r1=164(y), r2=41(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=52(y), r7=47(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 164
LDI r2, 41
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 52
LDI r7, 47
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
