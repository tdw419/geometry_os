; DESCRIPTION: Creates a yellow rectangular region at (84, 228) spanning 27 by 18 pixels.
; PLAN: r0=84(x), r1=228(y), r2=27(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 228
LDI r2, 27
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
