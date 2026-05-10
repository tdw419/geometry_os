; DESCRIPTION: Renders a cyan rectangular region spanning 95 by 25 at (400, 83).
; PLAN: r0=400(x), r1=83(y), r2=95(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 83
LDI r2, 95
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
