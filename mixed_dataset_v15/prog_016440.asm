; DESCRIPTION: Composite: Draws a orange line from (397, 178) to (499, 208) then Creates a red circular shape at (294, 128) with radius 76.
; PLAN: r0=397(x1), r1=178(y1), r2=499(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=128(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 397
LDI r1, 178
LDI r2, 499
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 128
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
