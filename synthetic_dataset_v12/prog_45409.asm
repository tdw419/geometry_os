; DESCRIPTION: Creates a black rectangular region at (298, 228) spanning 25 by 18 pixels.
; PLAN: r0=298(x), r1=228(y), r2=25(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 228
LDI r2, 25
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
