; DESCRIPTION: Renders a red box of size 83x42 starting at (165, 75).
; PLAN: r0=165(x), r1=75(y), r2=83(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 75
LDI r2, 83
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
