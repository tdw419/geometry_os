; DESCRIPTION: Creates a green rectangular region at (188, 157) spanning 113 by 50 pixels.
; PLAN: r0=188(x), r1=157(y), r2=113(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 157
LDI r2, 113
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
