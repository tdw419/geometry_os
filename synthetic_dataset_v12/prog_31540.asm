; DESCRIPTION: Creates a cyan rectangular region at (148, 114) spanning 17 by 63 pixels.
; PLAN: r0=148(x), r1=114(y), r2=17(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 114
LDI r2, 17
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
