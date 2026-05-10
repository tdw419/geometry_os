; DESCRIPTION: Creates a green rectangular region at (117, 173) spanning 93 by 45 pixels.
; PLAN: r0=117(x), r1=173(y), r2=93(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 173
LDI r2, 93
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
