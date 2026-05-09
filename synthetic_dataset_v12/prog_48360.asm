; DESCRIPTION: Creates a black rectangular region at (294, 93) spanning 75 by 100 pixels.
; PLAN: r0=294(x), r1=93(y), r2=75(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 93
LDI r2, 75
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
