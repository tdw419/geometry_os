; DESCRIPTION: Composite: Draws a yellow line from (286, 228) to (459, 28) then Creates a white circular shape at (291, 146) with radius 56.
; PLAN: r0=286(x1), r1=228(y1), r2=459(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=146(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 228
LDI r2, 459
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 146
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
