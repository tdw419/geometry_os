; DESCRIPTION: Creates a green rectangular region at (102, 39) spanning 120 by 27 pixels.
; PLAN: r0=102(x), r1=39(y), r2=120(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 39
LDI r2, 120
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
