; DESCRIPTION: Creates a green rectangular region at (405, 188) spanning 93 by 50 pixels.
; PLAN: r0=405(x), r1=188(y), r2=93(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 188
LDI r2, 93
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
