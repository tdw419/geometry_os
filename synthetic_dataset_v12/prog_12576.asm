; DESCRIPTION: Creates a black rectangular region at (320, 111) spanning 113 by 98 pixels.
; PLAN: r0=320(x), r1=111(y), r2=113(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 111
LDI r2, 113
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
