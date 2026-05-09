; DESCRIPTION: Creates a red rectangular region at (198, 94) spanning 23 by 61 pixels.
; PLAN: r0=198(x), r1=94(y), r2=23(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 94
LDI r2, 23
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
