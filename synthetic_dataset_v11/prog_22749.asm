; DESCRIPTION: Creates a black rectangular region at (75, 129) spanning 82 by 10 pixels.
; PLAN: r0=75(x), r1=129(y), r2=82(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 129
LDI r2, 82
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
