; DESCRIPTION: Creates a red rectangular region at (394, 150) spanning 95 by 52 pixels.
; PLAN: r0=394(x), r1=150(y), r2=95(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 150
LDI r2, 95
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
