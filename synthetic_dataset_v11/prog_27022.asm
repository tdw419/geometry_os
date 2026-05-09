; DESCRIPTION: Creates a green rectangular region at (120, 213) spanning 111 by 33 pixels.
; PLAN: r0=120(x), r1=213(y), r2=111(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 213
LDI r2, 111
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
