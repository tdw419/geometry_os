; DESCRIPTION: Places a orange 102x17 rectangle at position (65, 27).
; PLAN: r0=65(x), r1=27(y), r2=102(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 27
LDI r2, 102
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
