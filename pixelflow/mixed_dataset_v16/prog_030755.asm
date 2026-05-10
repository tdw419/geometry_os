; DESCRIPTION: Creates a red rectangular region at (249, 10) spanning 86 by 80 pixels.
; PLAN: r0=249(x), r1=10(y), r2=86(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 10
LDI r2, 86
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
