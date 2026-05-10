; DESCRIPTION: Renders a white rectangular region spanning 113 by 98 at (248, 150).
; PLAN: r0=248(x), r1=150(y), r2=113(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 150
LDI r2, 113
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
