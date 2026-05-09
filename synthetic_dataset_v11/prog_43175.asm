; DESCRIPTION: Creates a red rectangular region at (217, 213) spanning 23 by 10 pixels.
; PLAN: r0=217(x), r1=213(y), r2=23(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 213
LDI r2, 23
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
