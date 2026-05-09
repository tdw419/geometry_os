; DESCRIPTION: Creates a red rectangular region at (207, 117) spanning 45 by 52 pixels.
; PLAN: r0=207(x), r1=117(y), r2=45(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 117
LDI r2, 45
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
