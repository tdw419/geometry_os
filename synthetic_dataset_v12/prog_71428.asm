; DESCRIPTION: Creates a red rectangular region at (223, 142) spanning 10 by 21 pixels.
; PLAN: r0=223(x), r1=142(y), r2=10(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 142
LDI r2, 10
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
