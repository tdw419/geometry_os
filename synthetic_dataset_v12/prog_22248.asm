; DESCRIPTION: Draws a orange circle centered at (284, 146) with radius 55.
; PLAN: r0=284(x), r1=146(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 146
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
