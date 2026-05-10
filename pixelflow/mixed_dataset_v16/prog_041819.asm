; DESCRIPTION: Creates a green rectangular region at (387, 188) spanning 82 by 39 pixels.
; PLAN: r0=387(x), r1=188(y), r2=82(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 188
LDI r2, 82
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
